DEVHUB=agentforce-data-cloud-dev-ed
ALIAS:=$(shell basename $(shell pwd -P))

open-in-dev:
	open -a "Google Chrome Dev" `sf org open --url-only --json | jq -r .result.url`

1-init-project:
	cd .. && sf project generate --name ${ALIAS}
	rm README.md config/project-scratch-def.json
	# cp ../knowledge-scratch/config/knowledge-scratch.json config/scratch1.json

2-open-devhub:
	sf org open -u ${DEVHUB} -p lightning/o/ActiveScratchOrg/list?filterName=Recent

3-create-scratch-org:
	sf org create scratch --target-dev-hub=${DEVHUB} -f ./config/project-scratch-def.json --duration-days=30 -a ${ALIAS} --set-default

4-sf-config:
	clear
	-cat .sf/config.json
	@echo
	sf config list
	@echo

5-open:
	sf org open -o ${ALIAS} -p lightning/setup/SetupOneHome/home

6-delete-scratch-org:
	@echo
	@echo SURE? COPY \& PASTE
	@echo
	@echo "sf org delete scratch --target-org ${ALIAS}"
	@echo

7-get-token-and-instance-url:
	sf org display | grep 'Access Token' | sed 's/Access Token *//' > .token
	grep '^.token' .gitignore || echo '.token' >> .gitignore
	sf org display | grep 'Instance Url' | sed 's/Instance Url *//' > .instance-url
	grep '^.instance-url' .gitignore || echo '.instance-url' >> .gitignore
	@echo
	sf data query -q "select CreatedDate from SetupAuditTrail order by CreatedDate asc limit 1"

limits:
	sf limits api display

git-info:
	@echo
	git status
	@echo
	@echo
	git log | head -5

git-amend:
	@echo
	@echo
	git status
	@echo
	@echo
	git add makefile
	@echo
	@echo
	git commit --amend --no-edit
	@echo
	@echo
	git log | head -5

deploy:
	sf project deploy start

deploy-f:
	sf project deploy start --ignore-errors

retrieve:
	sf project retrieve start

retrieve-f:
	sf project retrieve start --ignore-errors

deploy-preview:
	sf project deploy preview
