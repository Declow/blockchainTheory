#/bin/bash

send_to_address() {
    echo "Enter address"
    read address
    echo "Enter amount to send"
    read amount
    echo $(bitcoin-cli -regtest sendtoaddress $address $amount)
}

while getopts ":bsnl" opt; do
    case $opt in
        b)
            echo $(bitcoin-cli -regtest getbalance);;
        s)
            send_to_address;;
        n)
            echo $(bitcoin-cli -regtest getnewaddress);;
        l)
            echo $(bitcoin-cli -regtest listunspent) | python -m json.tool;;
        \?)
            echo "invalid option";;
        :)
            echo "Option -$OPTARG requires an argument." >&2
        exit 1;;
    esac
done
