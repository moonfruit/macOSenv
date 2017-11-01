#!/bin/sh

pfx() {
	openssl pkcs12 -in "$1" -nodes | openssl x509 -text
}

x509() {
	FMT="$2"
	if [ -z "$FMT" ]; then
		FMT="pem"
	fi
	openssl x509 -in "$1" -inform "$FMT" -text
}

p7b() {
	openssl pkcs7 -in "$1" -inform der -print_certs -text
}

crl() {
	openssl crl -in "$1" -inform der -noout -text | head -6
}

cert() {
	FIX=$(echo "$1" | sed 's/.*\.//')
	case "$FIX" in
		pfx|pkcs12|p12) pfx  "$1"     ;;
		der)            x509 "$1" der ;;
		pem|crt|cert)   x509 "$1"     ;;
		p7b)            p7b  "$1"     ;;
		crl)            crl  "$1"     ;;
		*) echo "Unkown file type: $1" >&2 ;;
	esac
}

while [ $# -gt 0 ]; do
	echo "================ $1 ================" >&2
	cert "$1"
	echo >&2
	shift
done
