# PDF-check.sh
Malicious PDF Checker is a professional Bash‑based security tool designed to analyze PDF files for suspicious or potentially harmful content. It detects embedded JavaScript, launch actions, malicious triggers, hidden objects, and other exploit indicators using static analysis—without opening or executing the PDF. Safe, simple, and effective 
# 🔍 Malicious PDF Checker (Bash)

A professional Bash-based security tool that scans PDF files for suspicious or potentially malicious content.  
This tool performs **static analysis** to detect embedded JavaScript, hidden objects, launch triggers, exploit indicators, and other dangerous PDF components.

---

## 🚀 Features

- ✔ Interactive interface  
- ✔ Asks user for PDF filename/path  
- ✔ Confirms permission before scanning  
- ✔ Detects:
  - Embedded JavaScript
  - Launch actions
  - Auto-execution triggers
  - Embedded files
  - Suspicious object streams
  - XFA dynamic forms
  - Shell or cmd execution attempts  
- ✔ Clean and professional output  
- ✔ Safe — **does NOT open or execute** any PDF content

---

## 📁 How to Use

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/malicious-pdf-checker.git
cd malicious-pdf-checker
chmod +x pdf_checker.sh
./pdf_checker.sh
╔══════════════════════════════════════╗
║     MALICIOUS PDF CHECKER TOOL       ║
╚══════════════════════════════════════╝

Enter the PDF file name or full path:
> invoice.pdf

Do you give permission to scan this PDF for malicious content? (yes/no)
> yes

✔ Permission granted. Starting scan...

--- Running Malicious Pattern Analysis ---
[!] Suspicious: Embedded JavaScript detected
[!] Suspicious: Launch action (very dangerous)

--- Scan Report ---
⚠ WARNING: Potential malicious behavior detected in this PDF.
sudo apt install poppler-utils
