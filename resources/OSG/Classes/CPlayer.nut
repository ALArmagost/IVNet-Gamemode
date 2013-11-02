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

local g_COriginalClass = CPlayerEntity;

class 
	CPlayerEntity extends CPlayerEntity
{
	/* WARNING
	 * This class is really hacky and can break things easily.
	 * Always be sure about what you're doing.
	 */

	m_iAccessLevel	= ACCESS_NONE;
	m_iLevel 		= 0;
	m_bRegistered	= false;
	m_bLogged		= false;
	m_ciCurrentArea	= null;

	function constructor(...)
	{
		/*	TODO:
		 *	-Load data from db or whatever
		 */
		m_iAccessLevel	= ACCESS_NONE;
		m_iLevel 		= 0;
		m_bRegistered	= false;
		m_bLogged		= false;
		m_ciCurrentArea	= null;
		sendMessage("->You initial values have been set.")
	}

	// Adding optional parameters to sendMessage
	function sendMessage(strMessage, xColor = 0xFFFFFFFF, bColorFormatting = false)
		g_COriginalClass.sendMessage(strMessage, xColor, bColorFormatting);
}