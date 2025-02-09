# OpenSTA, Static Timing Analyzer
# Copyright (c) 2022, Parallax Software, Inc.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

proc init_sta {} {
  global auto_index

  # Import exported commands from sta namespace to global namespace.
  sta::define_sta_cmds
  namespace import sta::*

  if { [info exists tclreadline::version] } {
    history
    history event
    eval $auto_index(::tclreadline::ScriptCompleter)
    ::tclreadline::readline builtincompleter true
    ::tclreadline::readline customcompleter ::tclreadline::ScriptCompleter
    proc ::tclreadline::prompt1 {} { return {% } }
    proc ::tclreadline::prompt2 {} { return {> } }
  }
}
