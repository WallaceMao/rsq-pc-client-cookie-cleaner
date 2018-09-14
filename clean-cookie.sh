#!/bin/sh
rsq_path="~/Library/Application Support/rishiqing"
rsq_cookie_path=$rsq_path/Cookies
rsq_cookie_journal_path=$rsq_path/Cookies-journal
rsq_exe_program=rishiqing
echo INFO: begin to clean rishiqing cache file

# check rsq_path exist
if [ ! -d $rsq_path ]
then
  echo WARN: rishiqing path not exist
  exit 0
fi

echo cleaning......
# kill rishiqing.exe process
rsq_program_id=`ps -ef | grep ${rsq_exe_program} | grep -v grep | awk '{print $2}'`
if [ "$rsq_program_id" != "" ]
then
  for pid in $rsq_program_id
  do
    echo INFO: killing process pid $pid
    kill -9 $pid
  done
  sleep 5
fi

# delete cookie file
if [ -e $rsq_cookie_path ]
then
  echo INFO: deleting file: $rsq_cookie_path
  rm -rf $rsq_cookie_path
  echo INFO: done delete file $rsq_cookie_path
else
  echo WARN: $rsq_cookie_path not found
fi

# delete cookie journal file
if [ -e $rsq_cookie_journal_path ]
then
  echo INFO: deleting file: $rsq_cookie_journal_path
  rm -rf $rsq_cookie_journal_path
  echo INFO: done delete file $rsq_cookie_journal_path
else
  echo WARN: $rsq_cookie_journal_path not found
fi

exit 0