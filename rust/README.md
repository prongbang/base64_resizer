# resizer

### Write file

- Crate

```toml
image = "0.24.1"
```

- Write destination image as PNG-file

```rust
let file = File::create("./data/icon.png").unwrap();
let mut result_buf = BufWriter::new(file);
PngEncoder::new(&mut result_buf)
    .write_image(
        dst_image.buffer(),
        dst_width.get(),
        dst_height.get(),
        ColorType::Rgba8,
    ).unwrap();
```