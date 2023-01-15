# File          mxConsole
# Desc          A rework of MultiversXs original script.sh routine to help node operators
#                       with a bit of tidying up of code and presentation, and limits to entry for
#                       options (to 1char only).
# Todo:         Create options to manage entire upgrade for mainnet in one selection
# Author        Drew Curry, ApeStaking
# Version       0.9.0
# Date		jan15-2023
# Location      MultiversXs main folder

#!/bin/bash

# ---------------
# basic startup test, ensure 0 or 1 param only (todo: multiple params)
# main loop will always process 1x, and if numParams=0, will loop until user quits
# todo: param pre-check for correctness
#	Note: app currently does not process params, this LFR (left for reference)

# ensure exact path to script file
# link to mx source files, which links remaining required files

# SCRIPTPATH is an important variable in original setup, but was illogical
# Rewriting and resetting and relying on mx*Folder for needed paths
# Simple logic: this mxConsole.sh, like script.sh is ALWAYS in /mx-chain-scripts
#       which is always in the original CUSTOM_HOME folder, and which always
#       has a config folder, where the mass of logic lies in *.cfg files
# This enables: mxHomeFolder, mxScriptFolder, mxConfigFolder

# There should only be one /mx-chain-scripts folder, use that as our base.
# This will work from any starting folder.
currentFolder=$(find ~ -name "mx-chain-scripts" -type d)

source $currentFolder"/config/mx-Utility.cfg"
source $currentFolder"/config/mx-Init.cfg"

# mxScriptFolder gets set in mx-Init.cfg
SCRIPTPATH=$mxScriptFolder

# todo: these two variables conrol the menu's to loop only one time, skipping the actual itself
numParams=$#
loopApp=1

# structure here evolved a bit, left for future expansion
if [ $numParams -gt 0 ]; then
#        read -p "This version of mxConsole ignores any passed parameters." ignore
        tapToContinue "This version of mxConsole ignores any passed parameters."
fi

# =======MAIN LOOP=======

while  (( $loopApp )); do

        # call menu function that handles everything required to get on valid zero-based option to act on
        # menu call will set the variable before returning, and will guarantee validity.
        ShowMxMenu zeroBasedReply

        # =======ACT ON CHOICE=======

        # ============
        # process user selection/request, and loop again until either user quits OR user passed in a param, forcing 1 pass only.
        # Using repetitive code here to allow for easier specialization of feedback if testing suggests this is needed.
        # ============

        case ${options[$zeroBasedReply]} in
                $optA)  echo "You chose ${options[$zeroBasedReply]}"

                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                install
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi
                ;;
                $optB)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                observers
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optC)  echo "You chose ${options[$zeroBasedReply]}"
                                # Check if running observing squad
                                if [ -e /etc/systemd/system/elrond-proxy.service ]; then
                                        echo -e "${RED}--> You are running in the OBSERVING SQUAD configuration."
                                        echo -e "Redirecting to the ${CYAN}upgrade_squad${RED} option instead.${NC}"
                                        echo -e

                                        currentPrompt="Ok to Upgrade existing mainnet Observing Squad observers?"
                                        yesOrCancel userReply "$currentPrompt"
                                        if [[ $userReply  == "Y" ]]; then
                                                upgrade_squad
                                                tapToContinue "${options[$zeroBasedReply]} finished"
                                        fi
                                else
                                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                                        yesOrCancel userReply "$currentPrompt"
                                        if [[ $userReply  == "Y" ]]; then
                                                upgrade
                                                tapToContinue "${options[$zeroBasedReply]} finished"
                                        fi
                                fi

                ;;
                $optD)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                upgrade_squad
                                tapToContinue "${options[$zeroBasedReply]} finished"
                                
                        fi

                ;;
                $optE)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                upgrade_proxy
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optF)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                remove_db                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optG)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                start                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optI)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                stop                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optJ)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                cleanup                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optK)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                github_pull                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optL)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                add_node                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optM)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                get_logs                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optN)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                run_benchmark                 
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi

                ;;
                $optO)  echo "You chose ${options[$zeroBasedReply]}"
			# run Termui
                        # check node count, if >1 then create options message to get user to select which node
                        # standard node-0 runs on 8080, preset but adjust if needed 

                        portNumber=8080
                        selectedNode=0

                        #tmp: for testing
                        #mxNodeCount=3

                        # before showing termui, check nodecount, if we have more than one, offer slick selection
                        # else fall back to node-0, then run termui after if[]
                        zbNodeCount=$((mxNodeCount-1))
                        if [[ mxNodeCount -gt 1 ]]; then

                                nodeDisplayString=$(seq -s ", " 0 $zbNodeCount)
                                # produce (for ie 3 nodes): ( 0 1 2 C c X x ), allowing us to cancel with c or x
                                nodeChoices=$(seq -s " " 0 $zbNodeCount)
                                #store copy of just the valid nodes to double-check selection
                                nodeOnlyChoices=$nodeChoices
                                # add custome elements to allow cancelling out
                                nodeChoices+=( C c X x )

                                #options here are # for node to run with termui OR C|X to quit, 
                                getValidChoice "Run Termui on Node: ${nodeDisplayString} (CcXx-cancel)" selectedNode "${nodeChoices[@]}"

                        fi
                        
                        case ${selectedNode} in
                                [0-9]) # note: bash case's cannot use [1-10] as it only refers to the 1 value on either side of the '-'
                                        #create proper port number from selected digit, then ask YesOrCancel to continue
                                        portNumber=$((8080+$selectedNode))
                                        currentPrompt="Ready to run TermUI for Node-${selectedNode} on port ${portNumber}?"
                                        yesOrCancel userReply "$currentPrompt"
                                        if [[ $userReply  == "Y" ]]; then
                                                $HOME/elrond-utils/termui -address localhost:$portNumber
                                                tapToContinue "${options[$zeroBasedReply]} finished"
                                        fi

                                ;;
                                [CcXx]) #user cancel'd, be polite.  This offers a simple 'press any key to continue'
                                        tapToContinue

                                ;;
                                *)      #this is an odd case, provide mild warning
                                        tapToContinue "Unusual workflow during attempt to use termUI"

                        esac

                ;;
                $optP)  echo "You chose ${options[$zeroBasedReply]}"
			# Regular Node Upgrade
                        # a subtle cleaner UX, move curser 2 cols left to cover input
                        # todo: __ the menu now moves one line down, when it originally was not.
                        #       which means this is not needed.
                        tput cub 2

                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                RegularNodeUpgrade
                                # upgrade routine provides enough feedback, keep this mimimal
                                tapToContinue
                        fi

                ;;
                $optR)  echo "You chose ${options[$zeroBasedReply]}"
			# Full Node Upgrade (includes db removal)
                        # a subtle cleaner UX, move curser 2 cols left to cover input
                        tput cub 2

                        # for now, ensure we are only testnet to run FullNodeUpgrade
                        # todo: augment menu build to exclude it if mainnet (requires adjusting letters in menu)
                        if [[ $mxChainType == "testnet" ]]; then
                               currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                                yesOrCancel userReply "$currentPrompt"
                                if [[ $userReply  == "Y" ]]; then
                                        FullNodeUpgrade                 
                                        # tapTonContinue with finish mgs not appropriate here as there are multiple quit points in>
                                        ##tapToContinue ${options[$zeroBasedReply]} 
                                        tapToContinue
                                fi
                        else
                                tapToContinue "FullNodeUpgrade available for testnet only."
                        fi


                ;;
                $optS)  echo "You chose ${options[$zeroBasedReply]}"
                        currentPrompt="Ok to ${optionsDescs[$zeroBasedReply]}?"
                        yesOrCancel userReply "$currentPrompt"
                        if [[ $userReply  == "Y" ]]; then
                                #echo "Node DEBUG toggle will be available soon"                 
				ToggleDEBUG
                                tapToContinue "${options[$zeroBasedReply]} finished"
                        fi
                ;;
                #
                #  hidden options below
                #
                $optQ)  echo "You chose ${options[$zeroBasedReply]}"
                        echo -e
                        echo -e "${GREEN}--> Quitting ${title}...${NC}"
                        echo -e
                        break
                ;;
                $optX)  echo "You chose ${options[$zeroBasedReply]}"
                        echo -e
                        echo -e "${GREEN}--> Exiting ${title}...${NC}"
                        echo -e
                        break
                ;;
                $optH)  ShowMxHelp
                ;;
                
                *)       echo "Invalid option"

                ;;

        esac

        # =======END ACT ON CHOICE======

        # ===========
        # test if user sent in a param, thus exit after first function completion
        if [ $numParams -gt 0 ]; then
                loopApp=0
        fi

done
# =======END MAIN LOOP=======

echo "ciao!"
exit

# ======================================================


























