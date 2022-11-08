Earlier this week we experienced an outage in our M-pesa API infrastructure. Today we are providing an incident report that details the nature of the outage and our response
The following post-mortem for the M-pesa API infrastructure outage that occurred on November 0,2022. We understand this service issue has impacted our valued developers and users, and we apologize to everyone who was affected.
Issue Summary

From 12:00 AM to 3:00 AM EAT, request to most M-pesa APIs resulted in 500 error response messages. M-pesa applications that rely on these APIs also returned errors or had some functionality that was not working. At its peak, the issue affected 100% of traffic to the API infrastructure. Users could not access certain APIs that run on separate infrastructures. The root cause was an invalid configuration change that exposed a bug in a widely used internal library

Timeline (all times are in East African Time)
•	11.55 PM: Configuration push is made
•	12:30 AM: Outage begins
•	12:35 AM: Production teams alerted
•	1:40 AM: Failed configuration change roll back
•	2:25 AM: Rollback configurations push begins
•	2:30 AM: Successful configuration push
•	2:45 AM: Server restart begins
•	3:00 AM: 100% of traffic restored and back online

Root Cause
At 11:55 PM EAT, a configuration change was inadvertently releases to our production environment without being released to the testing environment. The change specified an invalid address for the authentication servers in production. This exposed a bug in the libraries which caused them to block permanently while attempting to resolve the invalid address to physical services. In addition, the internal monitoring system permanently blocked all the calls to the authentication library. The combination of the bug and configuration error quickly caused all the serving threads to be consumed. Traffic was constantly queued waiting for a serving thread to be available. The servers began repeatedly restarting as they attempt to recover and at 12:00 AM EAT, the service outage began
Resolution and recovery
At 12:35 AM EAT, the monitoring systems alerted our engineers who investigated and quickly escalated the issue. By 6:40 PM, the incident response team indicated that the monitoring system was increased the severity of the problem caused by the bug
At 1:40 AM, we attempted to roll back the problematic configuration change. This rollback failed due to complexity in the configuration system which caused our security checks to reject the rollback. These problems were addressed and we successfully rolled back at 2:30 AM.
Some jobs started to recover slowly, and we determined that the overall recovery would be faster by a restart of all of the API infrastructure servers globally. To help with the recovery, we turned off some of our monitoring systems which were triggered by the bug, to avoid cascading failures from a wide scale restart we decided to restart servers gradually by 3:00 AM 100% traffic was restored

CORRECTIVE AND PREVENTIVE MESURES
In the last two days, we have conducted an internal review and analysis of the outage. The following actions were taken to address the causes of the issue and to prevent future problems of the same nature
•	Change rollback process to be quicker and more robust
•	Fix the underlying authentication services to correct timeout on errors
•	Enforce staged rollouts of all configuration changes
M-pesa is committed to continuously and quickly improve our technology and processes to prevent outages. We appreciate your patients and again apologize for any inconvenience we could have caused to you, your user’s or your organization. We thank you for your business and continued support

