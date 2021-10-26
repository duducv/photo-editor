cargo +nightly ndk -t aarch64-linux-android  -o ../android/app/src/main/jniLibs  build -Zbuild-std  --release
cargo +nightly ndk -t armv7-linux-androideabi -o ./jniLibs build -Zbuild-std  --release 
cargo +nightly ndk -t x86_64-linux-android  -o ./jniLibs build -Zbuild-std  --release 
cargo +nightly ndk -t i686-linux-android -o ./jniLibs build -Zbuild-std  --release
