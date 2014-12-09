rule possible_turla : turla
{
        meta:
                description = "This is a simple test to scan for Turla as per the suggestion http://arstechnica.com/security/2014/12/powerful-highly-stealthy-linux-trojan-may-have-infected-victims-for-years/"
        thread_level = 3
        in_the_wild = true

        strings:
                $a = "TREX_PID=%u"
                $b = "Remote VS is empty !"

        condition:
                $a or $b
}
