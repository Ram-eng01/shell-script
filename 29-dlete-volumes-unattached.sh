#Delete Volumes which are not attached
#!/bin/bash
delete_unttached_vols() {
    echo "Lets Check Volume Status For Region $REGION"
    vols=$(aws ec2 describe-volumes --region $REGION | jq ".Volumes[].VolumeId" | tr -d '"')
    for vol in $vols; do
        STATUS=$(aws ec2 describe-volumes --volume-ids $vol | jq ".Volumes[].Attachments[].State" -r)
        if [[ "${STATUS}" = 'attached' ]]; then
            echo "$vol Is In Use By EC2 Instance. Dont Delete"
        else
            echo "Deleting Volume $vol As Its Not In Use."
            aws ec2 delete-volume --volume-id $vol --region $REGION
        fi
    done
}

for REGION in $(aws ec2 describe-regions | jq ".Regions[].RegionName" -r); do
    delete_unttached_vols $REGION
done

#0 23 * * * sudo bash /root/unttached_ebs.sh us-east-1
