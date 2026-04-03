kca() { 
  local agent_name="$1"
  local instance_file="/tmp/qca_${agent_name}_count"
  local count=1
  
  if [[ -f "$instance_file" ]]; then
    count=$(cat "$instance_file")
    count=$((count + 1))
  fi
  
  echo "$count" > "$instance_file"
  echo -e "\033]0;Q Agent: $agent_name #$count\007"
  kiro-cli chat --agent "$@"
}