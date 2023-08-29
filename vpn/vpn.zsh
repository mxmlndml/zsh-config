vpn() {
    local command=${funcstack[-1]}
    local serviceName

    printStatus() {
        echo "${serviceName}: $(scutil --nc status $serviceName 2>&1 | head -n 1)"
    }

    setServiceName() {
        vared -p 'Enter VPN service name: ' -c serviceName
        echo $serviceName > ~/.zsh/vpn/.env
    }

    if [ -e ~/.zsh/vpn/.env ]; then
        serviceName=$(< ~/.zsh/vpn/.env)
    else
        setServiceName
    fi

    case $1 in
        '')
        printStatus
        ;;

        status)
        printStatus
        ;;

        on)
        scutil --nc start $serviceName 2>/dev/null
        printStatus
        ;;

        off)
        scutil --nc stop $serviceName 2>/dev/null
        printStatus
        ;;

        get)
        echo $serviceName
        ;;

        set)
        setServiceName
        ;;

        help)
        echo "$command [command]\n"
        echo 'Usage:'
        echo "$command\t\tShorthand for $command status"
        echo "$command status\tIndicate whether the service is connected"
        echo "$command on\t\tStart the service"
        echo "$command off\t\tStop the service"
        echo "$command get\t\tPrint the set service name"
        echo "$command set\t\tSet the service name interactively"
        echo "$command help\tPrint this list of supported $command commands"
        ;;

        *)
        echo "Unknown command: $1\n\nTo see a list of supported $command commands, run:\n  $command help"
        ;;
    esac
}