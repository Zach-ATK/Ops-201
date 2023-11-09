# Declare variables

x="Internet Protocol Family"

# Declare functions

function display_inet {
  echo $x
  ip a | grep -w 'inet' | awk '{print $1, $2}'
}

# Main

display_inet
