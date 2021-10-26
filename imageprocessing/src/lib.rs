use std::slice;
use rayon::prelude::*;

#[no_mangle]
pub extern "C" fn red_channel(p: *const u8, len: libc::size_t, red: libc::size_t) -> *const u8 {
    
    let bytes_as_slices = unsafe { slice::from_raw_parts(p, len) };
    
   let new_vec: Vec<u8> = bytes_as_slices.to_vec().par_iter_mut().enumerate().map(|x| {
    if x.0 % 2 == 0 { *x.1 = red as u8};
    *x.1
 }).collect();

 new_vec.as_ptr()

}
