# This is to setup http proxy settings inside WSL session
#  Uses a px proxy running on Windows host on port 8085
#  Use for rare occations - neovim plugins setup/upgrade
#  Set all possible ENV variables, disable certificate checks
# curl/wget/ git clone github.com should work after that.


WIN_IP=$(/mnt/c/Windows/system32/ipconfig.exe /all |grep -E 'adapter|Address' |grep -A3 ' Ethernet ' |tail -1|cut -f2 -d:|cut -f1 -d\( |xargs)
echo "settings proxy to $WIN_IP:8085, do not forget to start UBS PX proxy"
export HTTP_PROXY="${WIN_IP}:8085"
export HTTPS_PROXY="${WIN_IP}:8085"
export http_proxy="${WIN_IP}:8085"
export https_proxy="${WIN_IP}:8085"
echo "creating .wgetrc"
echo "check_certificate = off" > ~/.wgetrc
echo "http_proxy = ${http_proxy}" >>~/.wgetrc
echo "https_proxy = ${https_proxy}" >>~/.wgetrc
echo "creating insecure .curlrc"
echo "insecure" >~/.curlrc
export GIT_SSL_NO_VERIFY=1
