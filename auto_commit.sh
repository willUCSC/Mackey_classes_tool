#! /bin/bash


numbering_file="commit-number";
input_commit=''; #if I have an input, then use that as a commit message 


if [[ $input_commit == '' ]];
then
    echo "Using automatic commit message.....";
    read commit_number < ${numbering_file};
    pre_message="This is a automatic commit, commit number is ";
    messgae=$pre_message$commit_number
    echo "adding files to git working space"
    git add .;
    echo "commiting files using auto commit"
    git commit -m "$messgae";
    echo "pushing to git remote repo"
    next_commiting_number=$((commit_number + 1))
    echo ${next_commiting_number} > ${numbering_file};
    git push origin master;
fi
