## install open attestation
npm install -g @govtechsg/open-attestation-cli

## wrapped issued document
open-attestation wrap raw-documents --output-dir wrapped-documents

## obfuscation
open-attestation filter camdigikey.json obfucate-camdigikey.json recipient.idNumber recipient.issueDate recipient.expireDate recipient.gender recipient.nationality recipient.camDigiKeyId