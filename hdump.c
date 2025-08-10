// SPDX-License-Identifier: JSON

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Version info
#define VERSION "hdump v1.0.0 by Breakout-X"
#define INFO_QUOTE "This is free software. You are free to use, modify, and distribute it without restriction."

// Prints a line of hex bytes without offset or ASCII
void print_line_hex(const unsigned char *buffer, size_t bytesRead, FILE *out) {
    for (size_t i = 0; i < bytesRead; i++) {
        fprintf(out, "%02X ", buffer[i]);
    }
    fprintf(out, "\n");
}

// Prints a full line: offset, hex bytes, and ASCII representation
void print_line_full(const unsigned char *buffer, size_t offset, size_t bytesRead, FILE *out) {
    fprintf(out, "%08X  ", (unsigned int)offset);
    for (size_t i = 0; i < 16; i++) {
        if (i < bytesRead)
            fprintf(out, "%02X ", buffer[i]);
        else
            fprintf(out, "   ");
    }
    fprintf(out, " ");
    for (size_t i = 0; i < bytesRead; i++) {
        char c = buffer[i];
        fprintf(out, "%c", (c >= 32 && c <= 126) ? c : '.');
    }
    fprintf(out, "\n");
}

// Prints only the ASCII representation of the bytes
void print_line_ascii(const unsigned char *buffer, size_t bytesRead, FILE *out) {
    for (size_t i = 0; i < bytesRead; i++) {
        char c = buffer[i];
        fprintf(out, "%c", (c >= 32 && c <= 126) ? c : '.');
    }
    fprintf(out, "\n");
}

// Prints usage instructions
void print_help() {
    printf("Usage:\n");
    printf("  hdump <input>\n");
    printf("  hdump -o <input> <output>\n");
    printf("  hdump -np <input>\n");
    printf("  hdump -np -o <input> <output>\n");
    printf("  hdump -op <input>\n");
    printf("  hdump -op -o <input> <output>\n");
    printf("Flags:\n");
    printf("  -np        No plaintext (hex only, no offset)\n");
    printf("  -op        Only plaintext (ASCII only)\n");
    printf("  -o         Output to file\n");
    printf("  -help      Show this help message\n");
    printf("  -version   Show version info\n");
    printf("  -v         Same as -version\n");
    printf("  -info      Show version and quote\n");
    printf("  -i         Same as -info\n");
    printf("  -license   Show license text\n");
    printf("  --license  Same as -license\n");
}

// Prints the full JSON License text
void print_license() {
    printf("Copyright (c) 2002 JSON.org\n\n");
    printf("Permission is hereby granted, free of charge, to any person obtaining a copy\n");
    printf("of this software and associated documentation files (the \"Software\"), to deal\n");
    printf("in the Software without restriction, including without limitation the rights\n");
    printf("to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\n");
    printf("copies of the Software, and to permit persons to whom the Software is\n");
    printf("furnished to do so, subject to the following conditions:\n\n");
    printf("The above copyright notice and this permission notice shall be included in\n");
    printf("all copies or substantial portions of the Software.\n\n");
    printf("The Software shall be used for Good, not Evil.\n\n");
    printf("THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\n");
    printf("IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\n");
    printf("FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\n");
    printf("AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\n");
    printf("LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\n");
    printf("OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\n");
    printf("SOFTWARE.\n");
}

int main(int argc, char *argv[]) {
    // Flags to control output format
    int showHex = 1;
    int showAscii = 1;
    int showOffset = 1;

    // File paths
    const char *inputPath = NULL;
    const char *outputPath = NULL;
    FILE *out = stdout;

    // Handle flags that don't require file input
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-help") == 0) {
            print_help();
            return 0;
        } else if (strcmp(argv[i], "-version") == 0 || strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "--version") == 0) {
            printf("%s\n", VERSION);
            return 0;
        } else if (strcmp(argv[i], "-info") == 0 || strcmp(argv[i], "-i") == 0) {
            printf("%s\n%s\n", VERSION, INFO_QUOTE);
            return 0;
        } else if (strcmp(argv[i], "-license") == 0 || strcmp(argv[i], "--license") == 0) {
            print_license();
            return 0;
        }
    }

    // Parse flags that affect output format
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-np") == 0) {
            showAscii = 0;
            showOffset = 0;
        } else if (strcmp(argv[i], "-op") == 0) {
            showHex = 0;
        } else if (strcmp(argv[i], "-o") == 0 && i + 2 < argc) {
            inputPath = argv[i + 1];
            outputPath = argv[i + 2];
            i += 2;
        } else if (!inputPath && argv[i][0] != '-') {
            inputPath = argv[i];
        }
    }

    // If no input file was provided, show usage
    if (!inputPath) {
        print_help();
        return 1;
    }

    // Open input file
    FILE *file = fopen(inputPath, "rb");
    if (!file) {
        perror("Error opening input file");
        return 1;
    }

    // Open output file if specified
    if (outputPath) {
        out = fopen(outputPath, "w");
        if (!out) {
            perror("Error opening output file");
            fclose(file);
            return 1;
        }
    }

    // Read and process file in 16-byte chunks
    unsigned char buffer[16];
    size_t offset = 0;
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), file)) > 0) {
        if (showHex && !showOffset) {
            print_line_hex(buffer, bytesRead, out);
        } else if (showHex && showAscii) {
            print_line_full(buffer, offset, bytesRead, out);
        } else if (showAscii && !showHex) {
            print_line_ascii(buffer, bytesRead, out);
        }
        offset += bytesRead;
    }

    // Clean up
    fclose(file);
    if (out != stdout) fclose(out);
    return 0;
}
