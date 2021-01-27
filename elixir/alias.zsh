alias pmix="cd ~/Code/playground && iex -S mix && cd -"
export ERL_AFLAGS="-kernel shell_history enabled"
alias iex_phx_dev="iex --sname sb_dev --cookie 1234 -S mix phx.server"
alias iex_phx_dev_remote="iex --sname sb_dev_2 --cookie 1234 --remsh sb_dev@Manuels-MBP"
alias iex_dev="iex --sname sb_dev --cookie 1234 -S mix"
alias iex_dev_remote="iex --sname sb_dev_2 --cookie 1234 --remsh sb_dev@Manuels-MBP"
alias elx_pr="mix dialyzer --plt && mix dialyzer && mix credo --strict && mix compile --warnings-as-errors && mix format && mix test"
alias incident_agent_on="gco incident_agent -- lib/runningball/incident_output"
alias incident_agent_off="rm -rf lib/runningball/incident_output"
alias ssh_simple_backend="ssh -i ~/Code/keys/simple_backend_keys.pem ubuntu@prod-backend-svc.production"
