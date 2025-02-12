#![windows_subsystem = "windows"]
use arboard::Clipboard;
use std::fs::File;
use std::io::Write;
use std::path::Path;
use image::RgbaImage;

fn get_unique_filename(base: &str, extension: &str) -> String {
    let mut counter = 0;
    loop {
        let filename = if counter == 0 {
            format!("{}.{}", base, extension)
        } else {
            format!("{}_{}.{}", base, counter, extension)
        };

        if !Path::new(&filename).exists() {
            return filename;
        }
        counter += 1;
    }
}

fn sanitize_filename(filename: &str) -> String {
    let forbidden_chars = ['/', '\\', ':', '*', '?', '"', '<', '>', '|'];
    filename.chars().filter(|c| !forbidden_chars.contains(c)).collect()
}

fn main() {

let mut clipboard = Clipboard::new().expect("Failed to access clipboard");

if let Ok(text) = clipboard.get_text() {

    let words: Vec<&str> = text.split(|c| match c {
        ' ' | ',' | '.' | '-' | '_' => true,
        _ => false,
    }).collect();

    // for item in &words { // Iterate over a reference to the vector
    //     println!("{}", item);}

        if words.len() > 4 {
        println!("Text is more than 4 words");
        let first4: Vec<&str> = words.iter().take(4).cloned().collect();
        let raw_title = first4.join(" ") + " [..]";
        let title: String = sanitize_filename(&raw_title);

        let mut file = File::create(format!("{}.txt", title)).expect("Failed to create file");
        file.write_all(text.as_bytes()).expect("Failed to write text to file");

        println!("The title is {}", title)

        } else if words.len() <= 4 {
            println!("Text is less than 4 words");
            let raw_title: String = words.join(" ");
            let title: String = sanitize_filename(&raw_title);
            println!("The title is {}", title);

            let mut file = File::create(format!("{}.txt", title)).expect("Failed to create file");
            file.write_all(text.as_bytes()).expect("Failed to write text to file");
        }

    } else if let Ok(image) = clipboard.get_image() {
        let img = RgbaImage::from_raw(
            image.width.try_into().unwrap(),
            image.height.try_into().unwrap(),
            image.bytes.into_owned(),
        )
        .expect("Failed to create image");

        // Generate unique filename
        let filename = get_unique_filename("clipboard_image", "png");

        img.save(Path::new(&filename)).expect("Failed to save image");
        println!("Image saved as {}", filename);
    } else {
        println!("Clipboard is empty or unsupported format.");
    }
}