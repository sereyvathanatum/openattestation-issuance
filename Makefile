CAMDIGIKEY_DIR = ./wrapped-document/camdigikey/*
MPWT_DIR = ./wrapped-document//mpwt/*
attest:
	rm -rf ./wrapped-document
	rm -rf ./obfuscated
	mkdir -p ./wrapped-document/camdigikey
	mkdir -p ./wrapped-document/mpwt
	mkdir -p ./obfuscated/camdigikey/
	mkdir -p ./obfuscated/mpwt/
	mkdir -p ./obfuscated/moeys/
	open-attestation wrap ./raw-documents/camdigikey --output-dir ./wrapped-document/camdigikey
	open-attestation wrap ./raw-documents/mpwt --output-dir ./wrapped-document/mpwt
	for file in $(CAMDIGIKEY_DIR) ; do \
		open-attestation filter ./wrapped-document/camdigikey/$$(basename $${file}) ./obfuscated/camdigikey/$$(basename $${file}) recipient.idNumber recipient.issueDate recipient.expireDate recipient.gender recipient.nationality recipient.camDigiKeyId ; \
	done
	for file in $(MPWT_DIR) ; do \
		open-attestation filter ./wrapped-document/mpwt/$$(basename $${file}) ./obfuscated/mpwt/$$(basename $${file}) recipient.id recipient.dateOfBirth recipient.gender recipient.firstName recipient.lastName recipient.idNumber recipient.passportNumber recipient.nationality recipient.specialCondition; \
	done
	open-attestation filter documents/moeys-1.json ./obfuscated/moeys/moeys-1.json certificate.barcode certificate.center certificate.examDate certificate.id certificate.metadata certificate.program certificate.rank certificate.signatureDate certificate.subjectGrades certificate.type id recipient