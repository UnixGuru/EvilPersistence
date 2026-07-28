
export PATH=/bin:/usr/bin:/usr/local/bin
LIBRE_OFFICE=/Applications/LibreOffice.app/Contents/MacOS/soffice
INPUT_FILE=Src/EvilPersistence.docx
TMP_FILE = $(shell mktemp --tmpdir=/tmp)
DATE = ${shell date}

EvilPersistence.fodt : ${INPUT_FILE}
	rm -f EvilPersistence.docx $@
	cp ${INPUT_FILE} .
	${LIBRE_OFFICE} -headless --convert-to fodt EvilPersistence.docx
	rm -f EvilPersistence.docx ${TMP_FILE}
	chmod 444 $@
	echo Last Change: ${DATE} > ${TMP_FILE}
	# git commit --template=${TMP_FILE} $@
	# git push
	rm git -f ${TMP_FILE}