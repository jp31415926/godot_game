from pydub import AudioSegment

def reverse_mp3(input_file, output_file):
	# Load the input MP3 file
	audio = AudioSegment.from_mp3(input_file)

	# Reverse the audio
	reversed_audio = audio.reverse()

	# Export the reversed audio to a new MP3 file
	reversed_audio.export(output_file, format="mp3")

if __name__ == "__main__":
	input_file = "input.mp3"  # Change this to your input MP3 file
	output_file = "output_reversed.mp3"  # Output file name

	reverse_mp3(input_file, output_file)
	print(f"Audio reversed and saved to {output_file}")
