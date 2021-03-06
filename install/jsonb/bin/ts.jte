#
# Copyright (c) 2017, 2018 Oracle and/or its affiliates. All rights reserved.
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License v. 2.0, which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# This Source Code may also be made available under the following Secondary
# Licenses when the conditions for such availability set forth in the
# Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
# version 2 with the GNU Classpath Exception, which is available at
# https://www.gnu.org/software/classpath/license.html.
#
# SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
#

#
# $Id$
#

#########################################################################
#                                                                   	#
#   JavaTest Environment file for JSON-B Compatibility Test Suite       #
#                                                                       #
#   Environment specific properties in this file will likely	        #
#   have to be modified prior to running the JSON-B TCK. Instructions   #
#   for modifying these properties are contained in this file.	        #
#                                                                       #
#########################################################################

############################################################################
# Properties to set prior to running the JSON-B TCK tests
#
# @jsonb.classes	-- Classes of the JSON-B RI Implementation needed to
#			            build and run the JSON-B TCK
#
#                          Added to ts.classpath, ts.run.classpath and
#                          sigTestClasspath below.
############################################################################
jsonb.classes=

###############################################################################
# DO NOT MODIFY
#
# @jsonb.resources	          -- Location of resources used by JSON-B TCK tests
# @jsonb.alt.provider.classes -- Specify location of alternate JsonProvider.
#				                 This is done automatically by run.pluggability
#                                target in ${ts.home}/bin/build.xml. This target
#                                in turn calls enable.alternate.jsonb.provider and
#                                disable.alternate.jsonb.provider targets to enable
#                                the alternate Json test provider when running the
#                                pluggability tests for SPI testing and to disable
#                                it after testing is complete.
#
#                                Added to ts.run.classpath below.
###############################################################################
#jsonb.resources=${ts.home}/src/com/sun/ts/tests/jsonb/resources
#jsonb.alt.provider.classes=jsonb.alt.provider.classes

####################################################################
# The jars/classes for the TS harness/javatest and the test classes
# @ts.harness.classpath --  Classes required by javatest
# @ts.classpath         --  Classes used to build the JSON-B tests
# @ts.run.classpath     --  Classes needed by test run
####################################################################
ts.harness.classpath=${ts.home}/lib/javatest.jar${pathsep}${ts.home}/lib/tsharness.jar${pathsep}${ts.home}/lib/jsonbtck.jar${pathsep}${ant.home}/lib/ant.jar

ts.classpath=${jsonb.classes}${pathsep}${ts.home}/lib/tsharness.jar${pathsep}${ts.home}/lib/jsonbtck.jar

ts.run.classpath=${ts.home}/lib/tsharness.jar${pathsep}${ts.home}/lib/sigtest.jar${pathsep}${ts.home}/lib/jsonbtck.jar${pathsep}${ts.home}/classes${pathsep}${ts.home}/bin${pathsep}${jsonb.classes}

###########################################################################
# @tools.jar  should be set to the location of the tools.jar from the 
# installed jdk
###########################################################################
tools.jar=${jdk.home}/lib/tools.jar

########################################################################
## Javatest batch mode work directory and report directory, and policy for
## handling existing work and report directories.  These properties affects
## runclient and report targets, but not gui target.
## To disable generating test report, unset report.dir, or set it to "none"
## either here or from command line, as in the following command:
##               ant runclient -Dreport.dir="none"
##
# @work.dir     The directory used to store Javatest test results and test
#               information.
# @report.dir   The directory used to store Javatest summary reports of
#               test results.
# @if.existing.work.report.dirs specifies how existing work.dir and
# report.dir will be handled, and it must be one of the following values:
# overwrite     overwrites all content in work.dir and report.dir
# backup        moves all content in work.dir and report.dir to
#               work.dir_time_day_bak and report.dir_time_day_bak,
#               respectively
# append        reuses and preserves the existing work.dir and report.dir
# auto          lets the build files decide which mode to use
#               (overwrite, backup or append).  the value is determined
#               like this:
#                  if.existing.work.report.dirs == auto
#                    if in JSON-B workspace
#                      if.existing.work.report.dirs = overwrite
#                    else we are in a distribution bundle
#                      if.existing.work.report.dirs = append
#                    end if
#                  else
#                    if.existing.work.report.dirs = value in this file
#                  end if
########################################################################
work.dir=/tmp/JTworkjsonb
report.dir=/tmp/JTreportjsonb
if.existing.work.report.dirs=append

###############################################################
## These properties must be set to tell the Test harness the
## class names of your porting class implementations.  By default
## the property settings below point to Sun RI specific classes.  
## both property sets below point to Sun RI specific classes.
###############################################################
porting.ts.url.class.1=com.sun.ts.lib.implementation.sun.common.SunRIURL

#########################################################################
# @sigTestClasspath: This property must be set when running signature 
#                    tests.  This property should be set to a list of
#                    jar files and/or directories which contain your 
#                    Java EE and Java SE classes. Paths must be 
#                    separated by the appropriate path separator 
#                    (';' windows, ':' Unixes).
#########################################################################
sigTestClasspath=${jsonb.classes}${pathsep}${JAVA_HOME}/lib/rt.jar

########################################################################
# These properties are used by the harness.  "harness.log.port"
# specifies the port that server components use to send logging
# output back to JavaTest.  If the default port # is not available
# on the machine running JavaTest, then you can set it here.
#
# @harness.temp.directory directory location used by the
#                         harness to store temporary files
#
# @harness.log.port  the port the harness listens on for log mesages
#                    from remote clients
#
# @harness.log.traceflag  used to turn on/off verbose debugging output
#                         for the tests.
#
# @harness.log.delayseconds  Number of seconds to delay to allow
#                            reporting from remote clients to finish.
#
# @harness.executeMode  used to run the harness in the following modes
#                       of execution:  2 - run only
#
# @harness.socket.retry.count - denotes the number of time we should
#           attempt to create a server socket when intilizing a test
#           client.  The socket is used for logging purposes.
########################################################################
harness.temp.directory=${ts.home}/tmp
harness.log.port=2000
harness.log.traceflag=false
harness.log.delayseconds=1 
harness.executeMode=2
harness.socket.retry.count=10

###############################################################
# @tz - your local timezone. For valid values, consult your
#       Operating System documentation.
###############################################################
tz=US/Eastern

########################################################################
# @javatest.timeout.factor This property specifies the scale factor used by
# Javatest to adjust the time JavaTest will wait for a given test to
# complete before returning failure.  For instance if the default test timeout
# is 5 minutes, this value will be multiplied by 5 minutes to determine
# the total timeout delay.  Note: this value only works with Javatest's
# batch mode (runclient).  When using the Javatest GUI users must change
# this timeout factor in the GUI. Configure -> Edit Configuration -> View
# -> choose Standard Values -> select tab Execution ->  set Time Factor.
########################################################################
javatest.timeout.factor=1.0

#######################################################################
#build level
#######################################################################
#1: compile only
#2: compile and build component archives (e.g., jar's, war's)
build.level=2

###############################################################
# @ts.display -- location to display JSON-B output on Unix
###############################################################
ts.display=:0.0

#######################################################################
# default deliverable class
#######################################################################
deliverable.class=com.sun.ts.lib.deliverable.jsonb.JSONBDeliverable

###############################################################
## This command allows the test clients to be run in
## the same JVM as JavaTest in this case.  This mode can be
## enabled by passing "-Dsame.jvm=true" to the runclient or gui
## targets.  NOTE: This option is only to be used for sanity
## checking and not when running the TCK for compatibility.
###############################################################
command.testExecuteSameJVM=com.sun.ts.lib.harness.ExecuteTSTestSameJVMCmd \
        $testExecuteClass $testExecuteArgs

########################################################################
## Common environment for both ts_unix and ts_win32
########################################################################
command.testExecute=com.sun.ts.lib.harness.ExecTSTestCmd \
        CLASSPATH=${ts.run.classpath} \
        DISPLAY="${ts.display}" \
		HOME="${user.home}"  \
		windir=${windir} \
		SYSTEMROOT=${SYSTEMROOT} \
        ${JAVA_HOME}/bin/java \
		-Djava.security.policy="${bin.dir}/harness.policy" \
		-Djava.security.manager \
		-Ddeliverable.class=${deliverable.class} \
        $testExecuteClass $testExecuteArgs

#########################################################################
## Environment for ts_unix
## The test execution commands inherit from common environment
## defined above: testExecute.
## If you need to override it, uncomment it in the following section.
#########################################################################
env.ts_unix.menu=true

########################################################################
## Environment for ts_win32
## The test execution commands inherit from common environment
## defined above: testExecute.
## If you need to override it, uncomment it in the following section.
########################################################################
env.ts_win32.menu=true

######################################################################
## Deliverables must set this property to the name of the deliverable
## specific library jar file (if create.manifest.extension.entries
## is set to true)
######################################################################
tslib.name=jsonbtck
