use std::slice;
use rayon::prelude::*;
use image::{Rgba, RgbaImage};

// x.0 % 4 = red-teal
// x0 % 2 = green - purple
// x0 % 3 = alfa
// x0 % 1 = black - white


#[no_mangle]
pub extern "C" fn temperature(p: *const u8, len: libc::size_t, slider: libc::size_t, width: libc::size_t, heigth: libc::size_t) -> *const u8 {
    
    let bytes_as_slices = unsafe { slice::from_raw_parts(p, len) };

    let mut img = RgbaImage::from_raw(width as u32, heigth as u32, bytes_as_slices.to_vec()).unwrap();


    
    for x in 0..img.width() {
        for y in 0..img.height() {

            // get actual pixel ex: Rgba([255, 0, 0, 255])
            let actual_pixel = img.get_pixel(x, y);
            let actual_red_pixel = actual_pixel[0];
            let actual_green_pixel = actual_pixel[1];
            let actual_blue_pixel = actual_pixel[2];
            let actual_alpha_pixel = actual_pixel[3];

            // clamp slider for allow only soft kelvin alteration
            let slider_value = if slider > 70 {
                70
            } else if slider < 30{
                30
            } else {
                slider as u8
            };

            // Red channel manipulation logic
            let red_channel_value = (actual_red_pixel as i32 * slider_value as i32) / 50;
    
            let final_value = if red_channel_value > 255 {
                255 as u8
            } else if red_channel_value < 5 {
                5 as u8
            } else {
                red_channel_value as u8
            };

            // Blue channel manipulation logic
            let value_blue =  (actual_blue_pixel as i32 * slider_value as i32) / 50;
            let value_blue_diff = value_blue - actual_blue_pixel as i32;
            
            let final_value_blue = if actual_blue_pixel as i32 - value_blue_diff > 255 {
                255 as u8
            } else if actual_blue_pixel as i32 - value_blue_diff < 5 {
                5 as u8
            } else {
                actual_blue_pixel - value_blue_diff as u8
            };

            img.put_pixel(x, y, Rgba([final_value, actual_green_pixel, final_value_blue, actual_alpha_pixel]));

        }
    };

    img.to_vec().as_ptr()
}

#[no_mangle]
pub extern "C" fn exposure(p: *const u8, len: libc::size_t, red: libc::size_t) -> *const u8 {
    
    let bytes_as_slices = unsafe { slice::from_raw_parts(p, len) };
    
   let new_vec: Vec<u8> = bytes_as_slices.to_vec().par_iter_mut().enumerate().map(|x| {
    if x.0 % 1 == 0 {
        let value = (*x.1 as i32 * red as i32) / 50;
    if value > 255 {
    *x.1 = 240
    } else if value < 0 {
    *x.1 = 10
    } else {
    *x.1 = value as u8;
    }
        };
    *x.1
    }).collect();

 new_vec.as_ptr()

}

#[no_mangle]
pub extern "C" fn tint(p: *const u8, len: libc::size_t, red: libc::size_t) -> *const u8 {
    
    let bytes_as_slices = unsafe { slice::from_raw_parts(p, len) };
    
   let new_vec: Vec<u8> = bytes_as_slices.to_vec().par_iter_mut().enumerate().map(|x| {
    let slider_value: i32 = if red > 70 {
        70
    } else if red < 20 {
        20
    } else {
        red as i32
    };
    if x.0 % 2 == 0 {
        let value = (*x.1 as i32 * slider_value ) / 50;
    if value > 255 {
    *x.1 = 255
    } else if value < 0 {
    *x.1 = 0
    } else {
    *x.1 = value as u8;
    }
        };
    *x.1
 }).collect();

 new_vec.as_ptr()

}