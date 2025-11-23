#!/bin/bash

# ====================== COLORS ==========================
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
BOLD="\e[1m"
NC="\e[0m"
# ========================================================

clear

echo -e "${BLUE}${BOLD}"
echo "╔══════════════════════════════════════╗"
echo "║     MALICIOUS PDF CHECKER TOOL       ║"
echo "║          Created by YOU              ║"
echo "╚══════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${YELLOW}Enter the PDF file name or full path:${NC}"
read -p "> " PDF_FILE

# Check empty input
if [[ -z "$PDF_FILE" ]]; then
    echo -e "${RED}Error: No input provided. Exiting...${NC}"
    exit 1
fi

# Check if file exists
if [[ ! -f "$PDF_FILE" ]]; then
    echo -e "${RED}Error: File not found!${NC}"
    exit 1
fi

echo -e "${YELLOW}Do you give permission to scan this PDF for malicious content? (yes/no)${NC}"
read -r PERMISSION

if [[ "$PERMISSION" != "yes" ]]; then
    echo -e "${RED}Permission denied. Stopping the tool...${NC}"
    exit 0
fi

echo ""
echo -e "${GREEN}✔ Permission granted. Starting scan...${NC}"
sleep 1
echo ""

# Extract PDF content
RAW_CONTENT=$(pdftotext "$PDF_FILE" - 2>/dev/null | sed 's/ //g')

# Fallback
if [[ -z "$RAW_CONTENT" ]]; then
    RAW_CONTENT=$(strings "$PDF_FILE")
fi

SUSPICIOUS=0

# Function to check patterns
check_pattern() {
    local PATTERN=$1
    local MESSAGE=$2

    if echo "$RAW_CONTENT" | grep -qi "$PATTERN"; then
        echo -e "${RED}[!] Suspicious: $MESSAGE${NC}"
        SUSPICIOUS=1
    fi
}

echo -e "${BLUE}${BOLD}--- Running Malicious Pattern Analysis ---${NC}"

check_pattern "JavaScript" "Embedded JavaScript detected"
check_pattern "/JS" "JavaScript object detected"
check_pattern "/OpenAction" "Auto-execution action present"
check_pattern "/AA" "Additional action triggers found"
check_pattern "/Launch" "Launch action (very dangerous)"
check_pattern "/Action" "Suspicious action object"
check_pattern "/EmbeddedFile" "Embedded file detected"
check_pattern "/RichMedia" "Embedded multimedia detected"
check_pattern "/XFA" "Dynamic XFA (commonly exploited)"
check_pattern "/ObjStm" "Compressed object streams found"
check_pattern "cmd.exe" "Windows command execution attempt"
check_pattern "shell" "Possible shell command embedded"

echo ""
echo -e "${BLUE}${BOLD}--- Scan Report ---${NC}"

if [[ $SUSPICIOUS -eq 1 ]]; then
    echo -e "${RED}⚠ WARNING: Potential malicious behavior detected in this PDF.${NC}"
else
    echo -e "${GREEN}✔ No malicious patterns detected. PDF appears clean.${NC}"
fi

echo ""
echo -e "${YELLOW}Scan Completed.${NC}"
