# Clean environment set by proxy.sh
unset HTTP_PROXY
unset HTTPS_PROXY
unset http_proxy
unset https_proxy
echo "deleting .wgetrc"
rm ~/.wgetrc
echo "deleting .curlrc"
rm ~/.curlrc
unset GIT_SSL_NO_VERIFY
