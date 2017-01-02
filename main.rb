# rbridges
# Copyright (C) 2017  Mfrogy Starmade
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.


require "curses"

class PlayingWindow
	def initialize()
		Curses.init_screen
		Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE)
		Curses.init_pair(2, Curses::COLOR_WHITE, Curses::COLOR_BLACK)
		Curses.init_pair(3, Curses::COLOR_BLACK, Curses::COLOR_BLUE)
		Curses.init_pair(4, Curses::COLOR_RED, Curses::COLOR_BLUE)
		
		Curses.attrset(Curses.color_pair(1))
		@main_window = Curses::Window.new(Curses.lines, Curses.cols)
		@main_window.box("|","-")
		@maim_window.refresh
		Curses.attrset(Curses.color_pair(2))
	end
	
	def close()
		Cursers.close_screen
	end
end

game = PlayingWindow.new()
begin
	Curses.getch
ensure
	game.close()
end
