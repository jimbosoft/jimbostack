---
title: "AI Specs"
date: 2026-09-29
---

I have been using AI for software development for a while and I am learning some hard lessons. That is not surprising as some of the problems already existed before AI showed up. Much is made of spec driven development, but that has already failed, as every software developer will know that has worked with a BA. A good spec will, at best, cover 30% of the requirements, even if you write it yourself. This story was never going to end well.

<!--more-->
<br>

## AI fails
This is a list of things that have gone wrong so far.<br><br>

- Working on a CICD that produced temp files. AI came up with elaborate methods of managing and updating those files, till I suggested to just deleting them, hence solving the problem. AI thought that was brilliant. Why did AI go down this rabbit hole and produce a weirder and more complex solution in the process? Why could it not step back and reflect on the direction it was going?

- Similar problem. Writing terraform to install infra in AWS. In one of my environments I added a script to import the VPC as it already existed and should not be deleted. It had a connected VPN. When I came to use AI to install in another environments, it came up with an elaborate way of updating that script. Things got stranger and stranger till I told it to delete the script. It was a once off and would probably never be needed again. Either way it would be in source control. AI never considered that option.

- Writing a bash script to record the time it takes to write a file from an S3 bucket to on-prem disk. The timestamp on the file would be the same as the arrival time in S3 as "aws sync" copies the file stamp across. Hence I suggested using stat to look up the inode change time. The script got bigger and more complected with every step. First it had to record which file it had seen and then go back and see if the size stopped changing. Then stat the file. Ignore all files older then a few hours and so on. Then I discovered that stdio on the "aws sync" command can be used to determine the completion of the write. I re-wrote the script with a much smaller and simpler version. When confronted, AI said I had told it to uses stat, which is true, but it could see the aws sync script, so it knew what I was doing, why did it not suggest the much simpler version and just blindly follow my suggestion.

## Causes
- AI can't see the whole context like a human can
- AI is too easily lead and does not think enough about alternatives or better ways of doing it.
- Equally humans are too easily lead by AI. We are very susceptible to suggestion and only to happy to suspend thinking.
- Our specs are never very good. We just deal with it through iterative development. Try a bit, see how it goes, learn a few lessons. Try again or do the next bit. Review your work and go back and redo if required.
