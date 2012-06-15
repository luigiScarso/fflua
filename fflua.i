%module fflua
%include "cpointer.i"
%include "carrays.i"
%{
#include "fontforge/fontforge.h"
extern int running_script ;

%}


%ignore VerifyLanguages;
%ignore SLIContainsR2L;
%ignore SFFindNearTop;
%ignore SFRestoreNearTop;
%ignore AnchorClassesNextMerge;
%ignore SCInsertPST;
%ignore PSTDefaultFlags;
%ignore AdobeLigatureFormat;
%ignore AnchorPosFree;
%ignore AnchorPositioning;
%ignore CVT;
%ignore DebuggerCurrentRaster;
%ignore GradientHere;
%ignore LigTagFromUnicode;
%ignore MakeDupRef;
%ignore MDAdd;
%ignore PatternPrep;
%ignore PatternSCBounds;
%ignore PyFF;
%ignore SCAppendPosSub;
%ignore SCLigCaretheck;
%ignore SF;
%ignore SFFindKernClass;
%ignore SFFindVKernClass;
%ignore SFRenameTheseFeatureTags;
%ignore SFSetLayerWidthsStroked;
%ignore SFSplineMake;
%ignore SplineSetAddSpiroExtrema;
%ignore VSErrorsFromMask;
%ignore CVT;
%ignore PyFF_CallDictFunc;
%ignore PyFF_ErrorF3;
%ignore PyFF_ErrorString;
%ignore PyFF_FreeFV;
%ignore PyFF_FreeSC;
%ignore PyFF_FreeSF;
%ignore PyFF_Main;
%ignore PyFF_PickleMeToString;
%ignore PyFF_ProcessInitFiles;
%ignore PyFF_ScriptFile;
%ignore PyFF_ScriptString;
%ignore PyFF_Stdin;
%ignore PyFF_UnPickleMeToObjects;
%ignore SFRemoveUnusedNestedFeatures;
%ignore CVT_ImportPrivate;
%ignore SF_CloseAllInstrs;
%ignore FontForge_PythonInit;
%ignore ff_init;
%ignore ff_init_py3;
%ignore seperate_hint_controls;
//END


typedef signed char             int8_t;
typedef short int               int16_t;
typedef int                     int32_t;
typedef unsigned char           uint8_t;
typedef unsigned short int      uint16_t;
typedef unsigned int            uint32_t;

%include "fontforge/basics.h"
%include "fontforge/splinefont.h"
%include "fontforge/fontforge.h"
%include "fontforge/PfEd.h"

%array_functions(SplineChar *,SplineCharArray);
%array_functions(Layer ,LayerArray);
%array_functions(LayerInfo ,LayerInfoArray);
%array_functions(SplinePointList,SplinePointListArray)
%array_functions(Spline,SplineArray)

/*
typedef int32_t		int32;
typedef uint32_t	uint32;
typedef int16_t		int16;
typedef uint16_t	uint16;
typedef int8_t		int8;
typedef uint8_t		uint8;
*/
/*
%pointer_functions(uint8, Pointer_uint8);
%pointer_functions(uint16, Pointer_uint16);
%pointer_functions(uint32, Pointer_uint32);

%pointer_functions(int8, Pointer_int8);
%pointer_functions(int16, Pointer_int16);
%pointer_functions(int32, Pointer_int32);
*/

/*
%define MYCHR(ch1,ch2,ch3,ch4)
%inline %{
return CHR(ch1,ch2,ch3,ch4);
%}
%enddef
*/
%init %{
running_script = true;
# ifndef CHR
#  define CHR(ch1,ch2,ch3,ch4) (((ch1)<<24)|((ch2)<<16)|((ch3)<<8)|(ch4))
# endif
%}