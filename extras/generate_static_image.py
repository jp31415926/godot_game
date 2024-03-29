from PIL import Image
import random

def generate_static_image(width, height, max_line_len, white_percentage):
    black_pixel = (0, 0, 0, 0)
    white_pixel = (255, 255, 255, 128)

    img = Image.new("RGBA", (width, height), color=black_pixel)
    pixels = img.load()
    line_len = 0
    # Generate random white pixels
    for y in range(height):
        for x in range(width):
            if line_len == 0:
                if random.random() <= white_percentage:  # Adjust this threshold to control density of white pixels
                    pixels[x, y] = white_pixel
                    line_len = int(random.random() * max_line_len)
            else:
                pixels[x, y] = white_pixel
                line_len -= 1

    return img

def save_image(img, filename):
    img.save(filename)

if __name__ == "__main__":
    width = 1920
    height = 1080
    max_line_len = 20
    white_percentage = 0.015

    for imgnum in range(1, 4):
        static_img = generate_static_image(width, height, max_line_len, white_percentage)
        save_image(static_img, f"static_image{imgnum}.png")
        print(f"Image generated and saved as static_image{imgnum}.png")
