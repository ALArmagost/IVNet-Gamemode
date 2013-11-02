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
 *  @file: Constants.nut
 *	@desc: Contains all constants for OSG
 *	@init-author: Jan Christophersen
 *	@date: 23.10.2013
 */

const MODE_NAME_SHORT			=	"OSG";
const MODE_NAME_LONG			=	"IV:Net Gamemode (OSG)";
const MODE_VERSION				=	"0.01";

const DEBUG_MODE				=	1;

const LOG_INFO					=	0;
const LOG_WARNING				=	1;
const LOG_ERROR					=	2;
const LOG_SUCCESS				=	3;
const LOG_NOPREFIX				=	4;

// USER ACCESS LEVELS
const ACCESS_NONE				=	0; // e.g. unregistered
const ACCESS_USER				=	1;
const ACCESS_MOD				=	2;
const ACCESS_MODERATOR			=	2;
const ACCESS_SVISOR 			=	3;
const ACCESS_SUPERVISOR			=	3;
const ACCESS_DEV				=	42;