vpn() {
    local SERVICE_NAME='Speedport Pro Plus'

    case $1 in
        on)
        scutil --nc start $SERVICE_NAME
        ;;

        off)
        scutil --nc stop $SERVICE_NAME
        ;;

        '')
        ;;

        *)
        echo "usage: vpn on or vpn off"
        return
        ;;
    esac

    echo "$SERVICE_NAME: $(scutil --nc status $SERVICE_NAME | head -n 1)"
}