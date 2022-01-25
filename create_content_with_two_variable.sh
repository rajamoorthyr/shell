#!/bin/bash
while IFS='|' read user email ; do
        printf "\ndn: uid=%s,ou=people,dc=gwl,dc=com \nchangetype: modify \nreplace:gwlPrimaryEmailAddr \ngwlPrimaryEmailAddr: %s\n\n" "${user}" "${email}"
done < <(paste -d"|" user.txt email.txt) >> new-output.txt
