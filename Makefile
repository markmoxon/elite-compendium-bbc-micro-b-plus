BEEBASM?=beebasm

.PHONY:all
all:
	$(BEEBASM) -i 1-source-files/main-sources/elite-readme.asm
	$(BEEBASM) -i 1-source-files/main-sources/elite-disc.asm -do 3-compiled-game-discs/elite-compendium-bbc-micro-b-plus.ssd -opt 3 -title "CompendiumB+"

.PHONY:b2
b2:
	curl -G "http://localhost:48075/reset/b2"
	curl -H "Content-Type:application/binary" --upload-file "3-compiled-game-discs/elite-compendium-bbc-micro-b-plus.ssd" "http://localhost:48075/run/b2?name=elite-compendium-bbc-micro-b-plus.ssd"
