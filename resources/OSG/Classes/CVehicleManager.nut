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
 *  @file: CVehicleManager.nut
 *	@desc: Our player manager
 *	@init-author: Jan Christophersen
 *	@date: 11.11.2013
 */

local m_Instance = null; // Need this here for singleton

class
	CVehicleManager
{
	// Variables
	m_tVehicles = null;

	function constructor ()
	{
		if (m_Instance != null)
			return log("CVehicleManager was initialized earlier.", LOG_ERROR);

		// Setting the instance
		m_Instance = this;

		// Resetting vars
		m_tVehicles = {};

		debug("CVehicleManager initialized.")
		return true;
	}

	function Create (iModel, fX, fY, fZ, fRot = 0.0, iColor1 = 0, iColor2 = 0, iColor3 = 0, iColor4 = 0, iColor5 = 0)
	{
		m_tVehicles [m_tVehicles.len()] <- createVehicle (iModel, fX, fY, fZ, fRot, iColor1, iColor2, iColor3, iColor4, iColor5);
	}

	function Exists (enVehicle)
	{
		foreach (i, val in m_tVehicles)
		{
			if (val == enVehicle)
				return true;
		}
		return false;
	}

	function GetIndex (enVehicle)
	{
		foreach (i, val in m_tVehicles)
		{
			if (val == enVehicle)
				return i;
		}
		return false;
	}

	function Remove (enVehicle)
	{
		if (!Exists(enVehicle))
			return false;

		/*	TODO:
		 *	-Remove the vehicle itself
		 */
		 
		// Remove the player from our manager
		delete m_tVehicles [GetIndex(enVehicle)];
	}
}