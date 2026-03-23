set -ex

source "${WORKSPACE}/jenkins_build_scripts/variables"
docker push ${full_image_names}



if [[ ${BRANCH_NAME} == [release]* ]]; then
    if [ ! -d "${NETFILERC}/github_iac_action/${github_iac_action_image_tag}" ]; then
        mkdir -p ${NETFILERC}/github_iac_action/${github_iac_action_image_tag}
        echo "Successfully created github_iac_actiondir in RC"
    else
        echo "Directory already exists in RC"
    fi
else
    echo "Skipping copy to RC stage as branch is not release"
fi