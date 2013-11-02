/*
 *	This file is part of IVNet-Gamemode (OSG).
 *
 *  IVNet-Gamemode (OSG) is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  IVNet-Gamemode (OSG) is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.

 *  You should have received a copy of the GNU General Public License
 *  along with IVNet-Gamemode (OSG).  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  @file: CPlayer.nut
 *	@desc: Contains the player class (Entity hooks etc.)
 *	@init-author: Jan Christophersen
 *	@date: 23.10.2013
 */

local _sendMessage = CPlayerEntity.sendMessage;

function CPlayerEntity::sendMessage(strMessage, xColor = 0xFFFFFF, bFormatting = true)
{
	return _sendMessage(strMessage, xColor, bFormatting);
}

function onPlayerJoin (enPlayer)
{
	enPlayer.sendMessage("Hey, you !");
	debug("Player " + enPlayer.getName() + " joined " + MODE_NAME_SHORT);
}
addEvent("playerJoin", onPlayerJoin);