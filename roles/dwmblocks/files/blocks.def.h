// Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
        /*Icon*/        /*Command*/                                   /*Update Interval*/     /*Update Signal*/
        {"🧠 ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g", 30, 0}, // Usando emoji para representar memória

        {"📅 ", "date '+%d/%m %H:%M'", 5, 0}, // Usando emoji para representar data e alterando o formato da data

        {"🔋 ", "acpi | awk '{ print $4 }' | cut -d, -f1", 30, 0}, // Usando emoji para representar a bateria

        {"🔊 ", "pamixer --get-volume", 5, 0}, // Usando emoji para representar o controle de volume pelo PulseAudio

};

// sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "|";
static unsigned int delimLen = 3;
