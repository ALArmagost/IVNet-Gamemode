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

class
	CPlayerEntity extends CPlayerEntity
{
	/* WARNING
	 * This class can break things easily since we are modifying
	 * the class that the server uses.
	 */

	/*m_iAccessLevel		=	ACCESS_NONE;
	m_iFaction			=	FACTION_NONE;
	m_iExperience		=	0;
	m_iLevel 			=	0;
	m_iMoney			=	0;

	m_bRegistered		=	false;
	m_bLogged			=	true;

	m_tVehicles			=	null; // Has to be defined individually
	m_tWeapons			=	null; // Has to be defined individually
	m_tSkills			=	null; // Has to be defined individually*/

	// Hooks
	function sendMessage (strMessage, xColor = 0xFFFFFF, bFormatting = true)
		return base.sendMessage(strMessage, xColor, bFormatting);
}
