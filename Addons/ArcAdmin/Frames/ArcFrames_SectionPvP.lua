-------------------------------------------------------------------------------------------------------------
--
-- ArcAdmin Version 3.x
-- ArcAdmin is a derivative of TrinityAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://arcemu.org/
-- GoogleCode Website: 
-- Subversion Repository: 
-- Dev Blog: 
-------------------------------------------------------------------------------------------------------------

-- Initializing dynamic frames with LUA and FrameLib
-- This script must be listed in the .toc after "ArcFrames_SectionTicket.lua"
-- Also some variables are globally taken from ArcAdmin.lua

function ArcAdmin:CreatePvPSection()
  local transparency = {
    bg = ArcAdmin.db.account.style.transparency.backgrounds,
    btn = ArcAdmin.db.account.style.transparency.buttons,
    frm = ArcAdmin.db.account.style.transparency.frames
  }
  local color = {
    bg = ArcAdmin.db.account.style.color.backgrounds,
    btn = ArcAdmin.db.account.style.color.buttons,
    frm = ArcAdmin.db.account.style.color.frames,
    linkifier = ArcAdmin.db.account.style.color.linkifier
  }
  
  FrameLib:BuildFontString({
    name = "ma_pvpplaceholder",
    group = "pvp",
    parent = ma_midframe,
    text = Locale["ma_ParameterizedCommands"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = 0
    }
  })

end
