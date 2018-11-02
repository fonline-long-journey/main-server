#include "fonline_ext.h"

// Initialization

// In this functions (DllMain and DllLoad) all global variables is NOT initialized, use FONLINE_DLL_ENTRY instead
#if defined ( FO_WINDOWS )
int __stdcall DllMain( void* module, unsigned long reason, void* reserved ) { return 1; }
#elif defined ( FO_LINUX )
void __attribute__( ( constructor ) ) DllLoad()   {}
void __attribute__( ( destructor ) )  DllUnload() {}
#endif

#ifdef __SERVER

// Returns true if map cell {hexX,hexY} is under roof
bool Map_HasRoof(Map& map, uint16 hexX, uint16 hexY){
	ProtoMap::TileVec& tiles = const_cast< ProtoMap::TileVec& >( map.Proto->Tiles );
	for( uint i = 0, length = tiles.size(); i < length; i++ ){
    	if( 
    		((tiles[ i ].HexX == hexX) || (tiles[ i ].HexX == hexX + 1)) // Roof tile may have size 2x2
    		&& ((tiles[ i ].HexY == hexY) || (tiles[ i ].HexY == hexY + 1))
    		&& tiles[ i ].IsRoof ) return true;
    }
    return false;
}

#endif

FONLINE_DLL_ENTRY( isCompiler )
{
	#ifdef __SERVER

	ASEngine->RegisterObjectMethod("Map", "bool HasRoof(uint16,uint16)", asFUNCTION(Map_HasRoof), asCALL_CDECL_OBJFIRST);

	#endif
}