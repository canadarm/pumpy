
#line 49 "exec/types.h"
 typedef void * APTR ;

 typedef long LONG ;
 typedef unsigned long ULONG ;
 typedef unsigned long LONGBITS ;
 typedef short WORD ;
 typedef unsigned short UWORD ;
 typedef unsigned short WORDBITS ;

 typedef signed char BYTE ;



 typedef unsigned char UBYTE ;
 typedef unsigned char BYTEBITS ;
 typedef unsigned short RPTR ;




 typedef unsigned char * STRPTR ;



 typedef const void * CONST_APTR ;



 typedef const unsigned char * CONST_STRPTR ;



 typedef short SHORT ;
 typedef unsigned short USHORT ;
 typedef short COUNT ;
 typedef unsigned short UCOUNT ;
 typedef ULONG CPTR ;



 typedef float FLOAT ;
 typedef double DOUBLE ;
 typedef short BOOL ;
 typedef unsigned char TEXT ;
#line 22 "exec/nodes.h"
 struct Node {
 struct Node * ln_Succ ;
 struct Node * ln_Pred ;
 UBYTE ln_Type ;
 BYTE ln_Pri ;
 char * ln_Name ;
 } ;


 struct MinNode {
 struct MinNode * mln_Succ ;
 struct MinNode * mln_Pred ;
 } ;
#line 20 "exec/lists.h"
 struct List {
 struct Node * lh_Head ;
 struct Node * lh_Tail ;
 struct Node * lh_TailPred ;
 UBYTE lh_Type ;
 UBYTE l_pad ;
 } ;




 struct MinList {
 struct MinNode * mlh_Head ;
 struct MinNode * mlh_Tail ;
 struct MinNode * mlh_TailPred ;
 } ;
#line 22 "exec/interrupts.h"
 struct Interrupt {
 struct Node is_Node ;
 APTR is_Data ;
 void ( * is_Code ) ( ) ;
 } ;


 struct IntVector {
 APTR iv_Data ;
 void ( * iv_Code ) ( ) ;
 struct Node * iv_Node ;
 } ;


 struct SoftIntList {
 struct List sh_List ;
 UWORD sh_Pad ;
 } ;
#line 34 "exec/libraries.h"
 struct Library {
 struct Node lib_Node ;
 UBYTE lib_Flags ;
 UBYTE lib_pad ;
 UWORD lib_NegSize ;
 UWORD lib_PosSize ;
 UWORD lib_Version ;
 UWORD lib_Revision ;
 APTR lib_IdString ;
 ULONG lib_Sum ;
 UWORD lib_OpenCnt ;
 } ;
#line 24 "exec/tasks.h"
 struct Task {
 struct Node tc_Node ;
 UBYTE tc_Flags ;
 UBYTE tc_State ;
 BYTE tc_IDNestCnt ;
 BYTE tc_TDNestCnt ;
 ULONG tc_SigAlloc ;
 ULONG tc_SigWait ;
 ULONG tc_SigRecvd ;
 ULONG tc_SigExcept ;
 UWORD tc_TrapAlloc ;
 UWORD tc_TrapAble ;
 APTR tc_ExceptData ;
 APTR tc_ExceptCode ;
 APTR tc_TrapData ;
 APTR tc_TrapCode ;
 APTR tc_SPReg ;
 APTR tc_SPLower ;
 APTR tc_SPUpper ;
 void ( * tc_Switch ) ( ) ;
 void ( * tc_Launch ) ( ) ;
 struct List tc_MemEntry ;
 APTR tc_UserData ;
 } ;




 struct StackSwapStruct {
 APTR stk_Lower ;
 ULONG stk_Upper ;
 APTR stk_Pointer ;
 } ;
#line 34 "exec/execbase.h"
 struct ExecBase {
 struct Library LibNode ;



 UWORD SoftVer ;
 WORD LowMemChkSum ;
 ULONG ChkBase ;
 APTR ColdCapture ;
 APTR CoolCapture ;
 APTR WarmCapture ;
 APTR SysStkUpper ;
 APTR SysStkLower ;
 ULONG MaxLocMem ;
 APTR DebugEntry ;
 APTR DebugData ;
 APTR AlertData ;
 APTR MaxExtMem ;

 UWORD ChkSum ;



 struct IntVector IntVects [ 16 ] ;



 struct Task * ThisTask ;

 ULONG IdleCount ;
 ULONG DispCount ;
 UWORD Quantum ;
 UWORD Elapsed ;
 UWORD SysFlags ;
 BYTE IDNestCnt ;
 BYTE TDNestCnt ;

 UWORD AttnFlags ;

 UWORD AttnResched ;
 APTR ResModules ;
 APTR TaskTrapCode ;
 APTR TaskExceptCode ;
 APTR TaskExitCode ;
 ULONG TaskSigAlloc ;
 UWORD TaskTrapAlloc ;




 struct List MemList ;
 struct List ResourceList ;
 struct List DeviceList ;
 struct List IntrList ;
 struct List LibList ;
 struct List PortList ;
 struct List TaskReady ;
 struct List TaskWait ;

 struct SoftIntList SoftInts [ 5 ] ;



 LONG LastAlert [ 4 ] ;











 UBYTE VBlankFrequency ;
 UBYTE PowerSupplyFrequency ;

 struct List SemaphoreList ;







 APTR KickMemPtr ;
 APTR KickTagPtr ;
 APTR KickCheckSum ;



 UWORD ex_Pad0 ;
 ULONG ex_LaunchPoint ;
 APTR ex_RamLibPrivate ;





 ULONG ex_EClockFrequency ;
 ULONG ex_CacheControl ;
 ULONG ex_TaskID ;

 ULONG ex_Reserved1 [ 5 ] ;

 APTR ex_MMULock ;

 ULONG ex_Reserved2 [ 3 ] ;






 struct MinList ex_MemHandlers ;
 APTR ex_MemHandler ;
 } ;
#line 20 "exec/memory.h"
 struct MemChunk {
 struct MemChunk * mc_Next ;
 ULONG mc_Bytes ;
 } ;




 struct MemHeader {
 struct Node mh_Node ;
 UWORD mh_Attributes ;
 struct MemChunk * mh_First ;
 APTR mh_Lower ;
 APTR mh_Upper ;
 ULONG mh_Free ;
 } ;




 struct MemEntry {
 union {
 ULONG meu_Reqs ;
 APTR meu_Addr ;
 } me_Un ;
 ULONG me_Length ;
 } ;









 struct MemList {
 struct Node ml_Node ;
 UWORD ml_NumEntries ;
 struct MemEntry ml_ME [ 1 ] ;
 } ;





























 struct MemHandlerData
 {
 ULONG memh_RequestSize ;
 ULONG memh_RequestFlags ;
 ULONG memh_Flags ;
 } ;
#line 28 "exec/ports.h"
 struct MsgPort {
 struct Node mp_Node ;
 UBYTE mp_Flags ;
 UBYTE mp_SigBit ;
 void * mp_SigTask ;
 struct List mp_MsgList ;
 } ;












 struct Message {
 struct Node mn_Node ;
 struct MsgPort * mn_ReplyPort ;
 UWORD mn_Length ;


 } ;
#line 24 "exec/devices.h"
 struct Device {
 struct Library dd_Library ;
 } ;




 struct Unit {
 struct MsgPort unit_MsgPort ;

 UBYTE unit_flags ;
 UBYTE unit_pad ;
 UWORD unit_OpenCnt ;
 } ;
#line 18 "exec/io.h"
 struct IORequest {
 struct Message io_Message ;
 struct Device * io_Device ;
 struct Unit * io_Unit ;
 UWORD io_Command ;
 UBYTE io_Flags ;
 BYTE io_Error ;
 } ;

 struct IOStdReq {
 struct Message io_Message ;
 struct Device * io_Device ;
 struct Unit * io_Unit ;
 UWORD io_Command ;
 UBYTE io_Flags ;
 BYTE io_Error ;
 ULONG io_Actual ;
 ULONG io_Length ;
 APTR io_Data ;
 ULONG io_Offset ;
 } ;
#line 33 "exec/semaphores.h"
 struct SemaphoreRequest
 {
 struct MinNode sr_Link ;
 struct Task * sr_Waiter ;
 } ;


 struct SignalSemaphore
 {
 struct Node ss_Link ;
 WORD ss_NestCount ;
 struct MinList ss_WaitQueue ;
 struct SemaphoreRequest ss_MultipleLink ;
 struct Task * ss_Owner ;
 WORD ss_QueueCount ;
 } ;


 struct SemaphoreMessage
 {
 struct Message ssm_Message ;
 struct SignalSemaphore * ssm_Semaphore ;
 } ;






 struct Semaphore
 {
 struct MsgPort sm_MsgPort ;
 WORD sm_Bids ;
 } ;
#line 20 "exec/avl.h"
 struct AVLNode
 {
 ULONG reserved [ 4 ] ;
 } ;


 typedef void * AVLKey ;









 typedef APTR AVLNODECOMP ;
 typedef APTR AVLKEYCOMP ;
#line 42 "clib/exec_protos.h"
 ULONG Supervisor ( ULONG ( * const userFunction ) ( ) ) ;


 void InitCode ( ULONG startClass , ULONG version ) ;
 void InitStruct ( const APTR initTable , APTR memory , ULONG size ) ;
 struct Library * MakeLibrary ( const APTR funcInit , const APTR structInit , ULONG ( * const libInit ) ( ) , ULONG dataSize , ULONG segList ) ;
 void MakeFunctions ( APTR target , const APTR functionArray , const APTR funcDispBase ) ;
 struct Resident * FindResident ( CONST_STRPTR name ) ;
 APTR InitResident ( const struct Resident * resident , ULONG segList ) ;

 void Alert ( ULONG alertNum ) ;
 void Debug ( ULONG flags ) ;

 void Disable ( void ) ;
 void Enable ( void ) ;
 void Forbid ( void ) ;
 void Permit ( void ) ;
 ULONG SetSR ( ULONG newSR , ULONG mask ) ;
 APTR SuperState ( void ) ;
 void UserState ( APTR sysStack ) ;
 struct Interrupt * SetIntVector ( LONG intNumber , const struct Interrupt * interrupt ) ;
 void AddIntServer ( LONG intNumber , struct Interrupt * interrupt ) ;
 void RemIntServer ( LONG intNumber , struct Interrupt * interrupt ) ;
 void Cause ( struct Interrupt * interrupt ) ;

 APTR Allocate ( struct MemHeader * freeList , ULONG byteSize ) ;
 void Deallocate ( struct MemHeader * freeList , APTR memoryBlock , ULONG byteSize ) ;
 APTR AllocMem ( ULONG byteSize , ULONG requirements ) ;
 APTR AllocAbs ( ULONG byteSize , APTR location ) ;
 void FreeMem ( APTR memoryBlock , ULONG byteSize ) ;
 ULONG AvailMem ( ULONG requirements ) ;
 struct MemList * AllocEntry ( struct MemList * entry ) ;
 void FreeEntry ( struct MemList * entry ) ;

 void Insert ( struct List * list , struct Node * node , struct Node * pred ) ;
 void AddHead ( struct List * list , struct Node * node ) ;
 void AddTail ( struct List * list , struct Node * node ) ;
 void Remove ( struct Node * node ) ;
 struct Node * RemHead ( struct List * list ) ;
 struct Node * RemTail ( struct List * list ) ;
 void Enqueue ( struct List * list , struct Node * node ) ;
 struct Node * FindName ( struct List * list , CONST_STRPTR name ) ;

 APTR AddTask ( struct Task * task , const APTR initPC , const APTR finalPC ) ;
 void RemTask ( struct Task * task ) ;
 struct Task * FindTask ( CONST_STRPTR name ) ;
 BYTE SetTaskPri ( struct Task * task , LONG priority ) ;
 ULONG SetSignal ( ULONG newSignals , ULONG signalSet ) ;
 ULONG SetExcept ( ULONG newSignals , ULONG signalSet ) ;
 ULONG Wait ( ULONG signalSet ) ;
 void Signal ( struct Task * task , ULONG signalSet ) ;
 BYTE AllocSignal ( LONG signalNum ) ;
 void FreeSignal ( LONG signalNum ) ;
 LONG AllocTrap ( LONG trapNum ) ;
 void FreeTrap ( LONG trapNum ) ;

 void AddPort ( struct MsgPort * port ) ;
 void RemPort ( struct MsgPort * port ) ;
 void PutMsg ( struct MsgPort * port , struct Message * message ) ;
 struct Message * GetMsg ( struct MsgPort * port ) ;
 void ReplyMsg ( struct Message * message ) ;
 struct Message * WaitPort ( struct MsgPort * port ) ;
 struct MsgPort * FindPort ( CONST_STRPTR name ) ;

 void AddLibrary ( struct Library * library ) ;
 void RemLibrary ( struct Library * library ) ;
 struct Library * OldOpenLibrary ( CONST_STRPTR libName ) ;
 void CloseLibrary ( struct Library * library ) ;
 APTR SetFunction ( struct Library * library , LONG funcOffset , ULONG ( * const newFunction ) ( ) ) ;
 void SumLibrary ( struct Library * library ) ;

 void AddDevice ( struct Device * device ) ;
 void RemDevice ( struct Device * device ) ;
 BYTE OpenDevice ( CONST_STRPTR devName , ULONG unit , struct IORequest * ioRequest , ULONG flags ) ;
 void CloseDevice ( struct IORequest * ioRequest ) ;
 BYTE DoIO ( struct IORequest * ioRequest ) ;
 void SendIO ( struct IORequest * ioRequest ) ;
 struct IORequest * CheckIO ( struct IORequest * ioRequest ) ;
 BYTE WaitIO ( struct IORequest * ioRequest ) ;
 void AbortIO ( struct IORequest * ioRequest ) ;

 void AddResource ( APTR resource ) ;
 void RemResource ( APTR resource ) ;
 APTR OpenResource ( CONST_STRPTR resName ) ;


 APTR RawDoFmt ( CONST_STRPTR formatString , const APTR dataStream , void ( * const putChProc ) ( ) , APTR putChData ) ;
 ULONG GetCC ( void ) ;
 ULONG TypeOfMem ( const APTR address ) ;
 ULONG Procure ( struct SignalSemaphore * sigSem , struct SemaphoreMessage * bidMsg ) ;
 void Vacate ( struct SignalSemaphore * sigSem , struct SemaphoreMessage * bidMsg ) ;
 struct Library * OpenLibrary ( CONST_STRPTR libName , ULONG version ) ;


 void InitSemaphore ( struct SignalSemaphore * sigSem ) ;
 void ObtainSemaphore ( struct SignalSemaphore * sigSem ) ;
 void ReleaseSemaphore ( struct SignalSemaphore * sigSem ) ;
 ULONG AttemptSemaphore ( struct SignalSemaphore * sigSem ) ;
 void ObtainSemaphoreList ( struct List * sigSem ) ;
 void ReleaseSemaphoreList ( struct List * sigSem ) ;
 struct SignalSemaphore * FindSemaphore ( STRPTR name ) ;
 void AddSemaphore ( struct SignalSemaphore * sigSem ) ;
 void RemSemaphore ( struct SignalSemaphore * sigSem ) ;

 ULONG SumKickData ( void ) ;

 void AddMemList ( ULONG size , ULONG attributes , LONG pri , APTR base , CONST_STRPTR name ) ;
 void CopyMem ( const APTR source , APTR dest , ULONG size ) ;
 void CopyMemQuick ( const APTR source , APTR dest , ULONG size ) ;


 void CacheClearU ( void ) ;
 void CacheClearE ( APTR address , ULONG length , ULONG caches ) ;
 ULONG CacheControl ( ULONG cacheBits , ULONG cacheMask ) ;

 APTR CreateIORequest ( const struct MsgPort * port , ULONG size ) ;
 void DeleteIORequest ( APTR iorequest ) ;
 struct MsgPort * CreateMsgPort ( void ) ;
 void DeleteMsgPort ( struct MsgPort * port ) ;
 void ObtainSemaphoreShared ( struct SignalSemaphore * sigSem ) ;

 APTR AllocVec ( ULONG byteSize , ULONG requirements ) ;
 void FreeVec ( APTR memoryBlock ) ;

 APTR CreatePool ( ULONG requirements , ULONG puddleSize , ULONG threshSize ) ;
 void DeletePool ( APTR poolHeader ) ;
 APTR AllocPooled ( APTR poolHeader , ULONG memSize ) ;
 void FreePooled ( APTR poolHeader , APTR memory , ULONG memSize ) ;

 ULONG AttemptSemaphoreShared ( struct SignalSemaphore * sigSem ) ;
 void ColdReboot ( void ) ;
 void StackSwap ( struct StackSwapStruct * newStack ) ;

 APTR CachePreDMA ( const APTR address , ULONG * length , ULONG flags ) ;
 void CachePostDMA ( const APTR address , ULONG * length , ULONG flags ) ;



 void AddMemHandler ( struct Interrupt * memhand ) ;
 void RemMemHandler ( struct Interrupt * memhand ) ;

 ULONG ObtainQuickVector ( APTR interruptCode ) ;


 void NewMinList ( struct MinList * minlist ) ;

 struct AVLNode * AVL_AddNode ( struct AVLNode * * root , struct AVLNode * node , APTR func ) ;
 struct AVLNode * AVL_RemNodeByAddress ( struct AVLNode * * root , struct AVLNode * node ) ;
 struct AVLNode * AVL_RemNodeByKey ( struct AVLNode * * root , AVLKey key , APTR func ) ;
 struct AVLNode * AVL_FindNode ( const struct AVLNode * root , AVLKey key , APTR func ) ;
 struct AVLNode * AVL_FindPrevNodeByAddress ( const struct AVLNode * node ) ;
 struct AVLNode * AVL_FindPrevNodeByKey ( const struct AVLNode * root , AVLKey key , APTR func ) ;
 struct AVLNode * AVL_FindNextNodeByAddress ( const struct AVLNode * node ) ;
 struct AVLNode * AVL_FindNextNodeByKey ( const struct AVLNode * root , AVLKey key , APTR func ) ;
 struct AVLNode * AVL_FindFirstNode ( const struct AVLNode * root ) ;
 struct AVLNode * AVL_FindLastNode ( const struct AVLNode * root ) ;
#line 52 "dos/dos.h"
 struct DateStamp {
 LONG ds_Days ;
 LONG ds_Minute ;
 LONG ds_Tick ;
 } ;




 struct FileInfoBlock {
 LONG fib_DiskKey ;
 LONG fib_DirEntryType ;

 char fib_FileName [ 108 ] ;
 LONG fib_Protection ;
 LONG fib_EntryType ;
 LONG fib_Size ;
 LONG fib_NumBlocks ;
 struct DateStamp fib_Date ;
 char fib_Comment [ 80 ] ;





 UWORD fib_OwnerUID ;
 UWORD fib_OwnerGID ;

 char fib_Reserved [ 32 ] ;
 } ;
















































 typedef long BPTR ;
 typedef long BSTR ;















 struct InfoData {
 LONG id_NumSoftErrors ;
 LONG id_UnitNumber ;
 LONG id_DiskState ;
 LONG id_NumBlocks ;
 LONG id_NumBlocksUsed ;
 LONG id_BytesPerBlock ;
 LONG id_DiskType ;
 BPTR id_VolumeNode ;
 LONG id_InUse ;
 } ;
#line 30 "devices/timer.h"
 struct timeval {
 ULONG tv_secs ;
 ULONG tv_micro ;
 } ;

 struct EClockVal {
 ULONG ev_hi ;
 ULONG ev_lo ;
 } ;

 struct timerequest {
 struct IORequest tr_node ;
 struct timeval tr_time ;
 } ;
#line 37 "dos/dosextens.h"
 struct Process {
 struct Task pr_Task ;
 struct MsgPort pr_MsgPort ;
 WORD pr_Pad ;
 BPTR pr_SegList ;
 LONG pr_StackSize ;
 APTR pr_GlobVec ;
 LONG pr_TaskNum ;
 BPTR pr_StackBase ;
 LONG pr_Result2 ;
 BPTR pr_CurrentDir ;
 BPTR pr_CIS ;
 BPTR pr_COS ;
 APTR pr_ConsoleTask ;
 APTR pr_FileSystemTask ;
 BPTR pr_CLI ;
 APTR pr_ReturnAddr ;
 APTR pr_PktWait ;
 APTR pr_WindowPtr ;


 BPTR pr_HomeDir ;
 LONG pr_Flags ;
 void ( * pr_ExitCode ) ( ) ;
 LONG pr_ExitData ;
 UBYTE * pr_Arguments ;
 struct MinList pr_LocalVars ;
 ULONG pr_ShellPrivate ;
 BPTR pr_CES ;
 } ;






















 struct FileHandle {
 struct Message * fh_Link ;
 struct MsgPort * fh_Port ;
 struct MsgPort * fh_Type ;

 LONG fh_Buf ;
 LONG fh_Pos ;
 LONG fh_End ;
 LONG fh_Funcs ;

 LONG fh_Func2 ;
 LONG fh_Func3 ;
 LONG fh_Args ;

 LONG fh_Arg2 ;
 } ;



 struct DosPacket {
 struct Message * dp_Link ;
 struct MsgPort * dp_Port ;

 LONG dp_Type ;


 LONG dp_Res1 ;



 LONG dp_Res2 ;






 LONG dp_Arg1 ;
 LONG dp_Arg2 ;
 LONG dp_Arg3 ;
 LONG dp_Arg4 ;
 LONG dp_Arg5 ;
 LONG dp_Arg6 ;
 LONG dp_Arg7 ;
 } ;





 struct StandardPacket {
 struct Message sp_Msg ;
 struct DosPacket sp_Pkt ;
 } ;




















































































 struct ErrorString {
 LONG * estr_Nums ;
 UBYTE * estr_Strings ;
 } ;






 struct DosLibrary {
 struct Library dl_lib ;
 struct RootNode * dl_Root ;
 APTR dl_GV ;
 LONG dl_A2 ;
 LONG dl_A5 ;
 LONG dl_A6 ;
 struct ErrorString * dl_Errors ;
 struct timerequest * dl_TimeReq ;
 struct Library * dl_UtilityBase ;
 struct Library * dl_IntuitionBase ;
 } ;



 struct RootNode {
 BPTR rn_TaskArray ;


 BPTR rn_ConsoleSegment ;
 struct DateStamp rn_Time ;
 LONG rn_RestartSeg ;
 BPTR rn_Info ;
 BPTR rn_FileHandlerSegment ;
 struct MinList rn_CliList ;

 struct MsgPort * rn_BootProc ;
 BPTR rn_ShellSegment ;
 LONG rn_Flags ;
 } ;







 struct CliProcList {
 struct MinNode cpl_Node ;
 LONG cpl_First ;
 struct MsgPort * * cpl_Array ;




 } ;

 struct DosInfo {
 BPTR di_McName ;

 BPTR di_DevInfo ;
 BPTR di_Devices ;
 BPTR di_Handlers ;
 APTR di_NetHand ;
 struct SignalSemaphore di_DevLock ;
 struct SignalSemaphore di_EntryLock ;
 struct SignalSemaphore di_DeleteLock ;
 } ;




 struct Segment {
 BPTR seg_Next ;
 LONG seg_UC ;
 BPTR seg_Seg ;
 UBYTE seg_Name [ 4 ] ;
 } ;









 struct CommandLineInterface {
 LONG cli_Result2 ;
 BSTR cli_SetName ;
 BPTR cli_CommandDir ;
 LONG cli_ReturnCode ;
 BSTR cli_CommandName ;
 LONG cli_FailLevel ;
 BSTR cli_Prompt ;
 BPTR cli_StandardInput ;
 BPTR cli_CurrentInput ;
 BSTR cli_CommandFile ;
 LONG cli_Interactive ;
 LONG cli_Background ;
 BPTR cli_CurrentOutput ;
 LONG cli_DefaultStack ;
 BPTR cli_StandardOutput ;
 BPTR cli_Module ;
 } ;










 struct DeviceList {
 BPTR dl_Next ;
 LONG dl_Type ;
 struct MsgPort * dl_Task ;
 BPTR dl_Lock ;
 struct DateStamp dl_VolumeDate ;
 BPTR dl_LockList ;
 LONG dl_DiskType ;
 LONG dl_unused ;
 BSTR dl_Name ;
 } ;



 struct DevInfo {
 BPTR dvi_Next ;
 LONG dvi_Type ;
 APTR dvi_Task ;
 BPTR dvi_Lock ;
 BSTR dvi_Handler ;
 LONG dvi_StackSize ;
 LONG dvi_Priority ;
 LONG dvi_Startup ;
 BPTR dvi_SegList ;
 BPTR dvi_GlobVec ;
 BSTR dvi_Name ;
 } ;



 struct DosList {
 BPTR dol_Next ;
 LONG dol_Type ;
 struct MsgPort * dol_Task ;
 BPTR dol_Lock ;
 union {
 struct {
 BSTR dol_Handler ;
 LONG dol_StackSize ;
 LONG dol_Priority ;
 ULONG dol_Startup ;
 BPTR dol_SegList ;
 BPTR dol_GlobVec ;


 } dol_handler ;

 struct {
 struct DateStamp dol_VolumeDate ;
 BPTR dol_LockList ;
 LONG dol_DiskType ;
 } dol_volume ;

 struct {
 UBYTE * dol_AssignName ;
 struct AssignList * dol_List ;
 } dol_assign ;

 } dol_misc ;

 BSTR dol_Name ;
 } ;



 struct AssignList {
 struct AssignList * al_Next ;
 BPTR al_Lock ;
 } ;










 struct DevProc {
 struct MsgPort * dvp_Port ;
 BPTR dvp_Lock ;
 ULONG dvp_Flags ;
 struct DosList * dvp_DevNode ;
 } ;





























 struct FileLock {
 BPTR fl_Link ;
 LONG fl_Key ;
 LONG fl_Access ;
 struct MsgPort * fl_Task ;
 BPTR fl_Volume ;
 } ;
#line 27 "dos/record.h"
 struct RecordLock {
 BPTR rec_FH ;
 ULONG rec_Offset ;
 ULONG rec_Length ;
 ULONG rec_Mode ;
 } ;
#line 61 "dos/rdargs.h"
 struct CSource {
 UBYTE * CS_Buffer ;
 LONG CS_Length ;
 LONG CS_CurChr ;
 } ;





























 struct RDArgs {
 struct CSource RDA_Source ;
 LONG RDA_DAList ;
 UBYTE * RDA_Buffer ;
 LONG RDA_BufSiz ;
 UBYTE * RDA_ExtHelp ;
 LONG RDA_Flags ;
 } ;
#line 52 "dos/dosasl.h"
 struct AnchorPath {
 struct AChain * ap_Base ;

 struct AChain * ap_Last ;

 LONG ap_BreakBits ;
 LONG ap_FoundBreak ;
 BYTE ap_Flags ;
 BYTE ap_Reserved ;
 WORD ap_Strlen ;

 struct FileInfoBlock ap_Info ;
 UBYTE ap_Buf [ 1 ] ;

 } ;
































 struct AChain {
 struct AChain * an_Child ;
 struct AChain * an_Parent ;
 BPTR an_Lock ;
 struct FileInfoBlock an_Info ;
 BYTE an_Flags ;
 UBYTE an_String [ 1 ] ;
 } ;
#line 25 "dos/var.h"
 struct LocalVar {
 struct Node lv_Node ;
 UWORD lv_Flags ;
 UBYTE * lv_Value ;
 ULONG lv_Len ;
 } ;
#line 39 "dos/notify.h"
 struct NotifyMessage {
 struct Message nm_ExecMessage ;
 ULONG nm_Class ;
 UWORD nm_Code ;
 struct NotifyRequest * nm_NReq ;
 ULONG nm_DoNotTouch ;
 ULONG nm_DoNotTouch2 ;
 } ;




 struct NotifyRequest {
 UBYTE * nr_Name ;
 UBYTE * nr_FullName ;
 ULONG nr_UserData ;
 ULONG nr_Flags ;

 union {

 struct {
 struct MsgPort * nr_Port ;
 } nr_Msg ;

 struct {
 struct Task * nr_Task ;
 UBYTE nr_SignalNum ;
 UBYTE nr_pad [ 3 ] ;
 } nr_Signal ;
 } nr_stuff ;

 ULONG nr_Reserved [ 4 ] ;


 ULONG nr_MsgCount ;
 struct MsgPort * nr_Handler ;
 } ;
#line 25 "dos/datetime.h"
 struct DateTime {
 struct DateStamp dat_Stamp ;
 UBYTE dat_Format ;
 UBYTE dat_Flags ;
 UBYTE * dat_StrDay ;
 UBYTE * dat_StrDate ;
 UBYTE * dat_StrTime ;
 } ;
#line 28 "utility/hooks.h"
 struct Hook
 {
 struct MinNode h_MinNode ;
 ULONG ( * h_Entry ) ( ) ;
 ULONG ( * h_SubEntry ) ( ) ;
 APTR h_Data ;
 } ;




 typedef unsigned long ( * HOOKFUNC ) ( ) ;
#line 45 "dos/exall.h"
 struct ExAllData {
 struct ExAllData * ed_Next ;
 UBYTE * ed_Name ;
 LONG ed_Type ;
 ULONG ed_Size ;
 ULONG ed_Prot ;
 ULONG ed_Days ;
 ULONG ed_Mins ;
 ULONG ed_Ticks ;
 UBYTE * ed_Comment ;
 UWORD ed_OwnerUID ;
 UWORD ed_OwnerGID ;
 } ;












 struct ExAllControl {
 ULONG eac_Entries ;
 ULONG eac_LastKey ;
 UBYTE * eac_MatchString ;
 struct Hook * eac_MatchFunc ;
 } ;
#line 30 "utility/tagitem.h"
 typedef ULONG Tag ;

 struct TagItem
 {
 Tag ti_Tag ;
 ULONG ti_Data ;
 } ;
#line 47 "clib/dos_protos.h"
 BPTR Open ( CONST_STRPTR name , LONG accessMode ) ;
 LONG Close ( BPTR file ) ;
 LONG Read ( BPTR file , APTR buffer , LONG length ) ;
 LONG Write ( BPTR file , const APTR buffer , LONG length ) ;
 BPTR Input ( void ) ;
 BPTR Output ( void ) ;
 LONG Seek ( BPTR file , LONG position , LONG offset ) ;
 LONG DeleteFile ( CONST_STRPTR name ) ;
 LONG Rename ( CONST_STRPTR oldName , CONST_STRPTR newName ) ;
 BPTR Lock ( CONST_STRPTR name , LONG type ) ;
 void UnLock ( BPTR lock ) ;
 BPTR DupLock ( BPTR lock ) ;
 LONG Examine ( BPTR lock , struct FileInfoBlock * fileInfoBlock ) ;
 LONG ExNext ( BPTR lock , struct FileInfoBlock * fileInfoBlock ) ;
 LONG Info ( BPTR lock , struct InfoData * parameterBlock ) ;
 BPTR CreateDir ( CONST_STRPTR name ) ;
 BPTR CurrentDir ( BPTR lock ) ;
 LONG IoErr ( void ) ;
 struct MsgPort * CreateProc ( CONST_STRPTR name , LONG pri , BPTR segList , LONG stackSize ) ;
 void Exit ( LONG returnCode ) ;
 BPTR LoadSeg ( CONST_STRPTR name ) ;
 void UnLoadSeg ( BPTR seglist ) ;
 struct MsgPort * DeviceProc ( CONST_STRPTR name ) ;
 LONG SetComment ( CONST_STRPTR name , CONST_STRPTR comment ) ;
 LONG SetProtection ( CONST_STRPTR name , LONG protect ) ;
 struct DateStamp * DateStamp ( struct DateStamp * date ) ;
 void Delay ( LONG timeout ) ;
 LONG WaitForChar ( BPTR file , LONG timeout ) ;
 BPTR ParentDir ( BPTR lock ) ;
 LONG IsInteractive ( BPTR file ) ;
 LONG Execute ( CONST_STRPTR string , BPTR file , BPTR file2 ) ;


 APTR AllocDosObject ( ULONG type , const struct TagItem * tags ) ;
 APTR AllocDosObjectTagList ( ULONG type , const struct TagItem * tags ) ;
 APTR AllocDosObjectTags ( ULONG type , ULONG tag1type , ... ) ;
 void FreeDosObject ( ULONG type , APTR ptr ) ;

 LONG DoPkt ( struct MsgPort * port , LONG action , LONG arg1 , LONG arg2 , LONG arg3 , LONG arg4 , LONG arg5 ) ;
 LONG DoPkt0 ( struct MsgPort * port , LONG action ) ;
 LONG DoPkt1 ( struct MsgPort * port , LONG action , LONG arg1 ) ;
 LONG DoPkt2 ( struct MsgPort * port , LONG action , LONG arg1 , LONG arg2 ) ;
 LONG DoPkt3 ( struct MsgPort * port , LONG action , LONG arg1 , LONG arg2 , LONG arg3 ) ;
 LONG DoPkt4 ( struct MsgPort * port , LONG action , LONG arg1 , LONG arg2 , LONG arg3 , LONG arg4 ) ;
 void SendPkt ( struct DosPacket * dp , struct MsgPort * port , struct MsgPort * replyport ) ;
 struct DosPacket * WaitPkt ( void ) ;
 void ReplyPkt ( struct DosPacket * dp , LONG res1 , LONG res2 ) ;
 void AbortPkt ( struct MsgPort * port , struct DosPacket * pkt ) ;

 BOOL LockRecord ( BPTR fh , ULONG offset , ULONG length , ULONG mode , ULONG timeout ) ;
 BOOL LockRecords ( struct RecordLock * recArray , ULONG timeout ) ;
 BOOL UnLockRecord ( BPTR fh , ULONG offset , ULONG length ) ;
 BOOL UnLockRecords ( struct RecordLock * recArray ) ;

 BPTR SelectInput ( BPTR fh ) ;
 BPTR SelectOutput ( BPTR fh ) ;
 LONG FGetC ( BPTR fh ) ;
 LONG FPutC ( BPTR fh , LONG ch ) ;
 LONG UnGetC ( BPTR fh , LONG character ) ;
 LONG FRead ( BPTR fh , APTR block , ULONG blocklen , ULONG number ) ;
 LONG FWrite ( BPTR fh , const APTR block , ULONG blocklen , ULONG number ) ;
 STRPTR FGets ( BPTR fh , STRPTR buf , ULONG buflen ) ;
 LONG FPuts ( BPTR fh , CONST_STRPTR str ) ;
 void VFWritef ( BPTR fh , CONST_STRPTR format , const LONG * argarray ) ;
 void FWritef ( BPTR fh , CONST_STRPTR format , ... ) ;
 LONG VFPrintf ( BPTR fh , CONST_STRPTR format , const APTR argarray ) ;
 LONG FPrintf ( BPTR fh , CONST_STRPTR format , ... ) ;
 LONG Flush ( BPTR fh ) ;
 LONG SetVBuf ( BPTR fh , STRPTR buff , LONG type , LONG size ) ;

 BPTR DupLockFromFH ( BPTR fh ) ;
 BPTR OpenFromLock ( BPTR lock ) ;
 BPTR ParentOfFH ( BPTR fh ) ;
 BOOL ExamineFH ( BPTR fh , struct FileInfoBlock * fib ) ;
 LONG SetFileDate ( CONST_STRPTR name , const struct DateStamp * date ) ;
 LONG NameFromLock ( BPTR lock , STRPTR buffer , LONG len ) ;
 LONG NameFromFH ( BPTR fh , STRPTR buffer , LONG len ) ;
 WORD SplitName ( CONST_STRPTR name , ULONG separator , STRPTR buf , LONG oldpos , LONG size ) ;
 LONG SameLock ( BPTR lock1 , BPTR lock2 ) ;
 LONG SetMode ( BPTR fh , LONG mode ) ;
 LONG ExAll ( BPTR lock , struct ExAllData * buffer , LONG size , LONG data , struct ExAllControl * control ) ;
 LONG ReadLink ( struct MsgPort * port , BPTR lock , CONST_STRPTR path , STRPTR buffer , ULONG size ) ;
 LONG MakeLink ( CONST_STRPTR name , LONG dest , LONG soft ) ;
 LONG ChangeMode ( LONG type , BPTR fh , LONG newmode ) ;
 LONG SetFileSize ( BPTR fh , LONG pos , LONG mode ) ;

 LONG SetIoErr ( LONG result ) ;
 BOOL Fault ( LONG code , STRPTR header , STRPTR buffer , LONG len ) ;
 BOOL PrintFault ( LONG code , CONST_STRPTR header ) ;
 LONG ErrorReport ( LONG code , LONG type , ULONG arg1 , struct MsgPort * device ) ;

 struct CommandLineInterface * Cli ( void ) ;
 struct Process * CreateNewProc ( const struct TagItem * tags ) ;
 struct Process * CreateNewProcTagList ( const struct TagItem * tags ) ;
 struct Process * CreateNewProcTags ( ULONG tag1type , ... ) ;
 LONG RunCommand ( BPTR seg , LONG stack , CONST_STRPTR paramptr , LONG paramlen ) ;
 struct MsgPort * GetConsoleTask ( void ) ;
 struct MsgPort * SetConsoleTask ( const struct MsgPort * task ) ;
 struct MsgPort * GetFileSysTask ( void ) ;
 struct MsgPort * SetFileSysTask ( const struct MsgPort * task ) ;
 STRPTR GetArgStr ( void ) ;
 BOOL SetArgStr ( CONST_STRPTR string ) ;
 struct Process * FindCliProc ( ULONG num ) ;
 ULONG MaxCli ( void ) ;
 BOOL SetCurrentDirName ( CONST_STRPTR name ) ;
 BOOL GetCurrentDirName ( STRPTR buf , LONG len ) ;
 BOOL SetProgramName ( CONST_STRPTR name ) ;
 BOOL GetProgramName ( STRPTR buf , LONG len ) ;
 BOOL SetPrompt ( CONST_STRPTR name ) ;
 BOOL GetPrompt ( STRPTR buf , LONG len ) ;
 BPTR SetProgramDir ( BPTR lock ) ;
 BPTR GetProgramDir ( void ) ;

 LONG SystemTagList ( CONST_STRPTR command , const struct TagItem * tags ) ;
 LONG System ( CONST_STRPTR command , const struct TagItem * tags ) ;
 LONG SystemTags ( CONST_STRPTR command , ULONG tag1type , ... ) ;
 LONG AssignLock ( CONST_STRPTR name , BPTR lock ) ;
 BOOL AssignLate ( CONST_STRPTR name , CONST_STRPTR path ) ;
 BOOL AssignPath ( CONST_STRPTR name , CONST_STRPTR path ) ;
 BOOL AssignAdd ( CONST_STRPTR name , BPTR lock ) ;
 LONG RemAssignList ( CONST_STRPTR name , BPTR lock ) ;
 struct DevProc * GetDeviceProc ( CONST_STRPTR name , struct DevProc * dp ) ;
 void FreeDeviceProc ( struct DevProc * dp ) ;
 struct DosList * LockDosList ( ULONG flags ) ;
 void UnLockDosList ( ULONG flags ) ;
 struct DosList * AttemptLockDosList ( ULONG flags ) ;
 BOOL RemDosEntry ( struct DosList * dlist ) ;
 LONG AddDosEntry ( struct DosList * dlist ) ;
 struct DosList * FindDosEntry ( const struct DosList * dlist , CONST_STRPTR name , ULONG flags ) ;
 struct DosList * NextDosEntry ( const struct DosList * dlist , ULONG flags ) ;
 struct DosList * MakeDosEntry ( CONST_STRPTR name , LONG type ) ;
 void FreeDosEntry ( struct DosList * dlist ) ;
 BOOL IsFileSystem ( CONST_STRPTR name ) ;

 BOOL Format ( CONST_STRPTR filesystem , CONST_STRPTR volumename , ULONG dostype ) ;
 LONG Relabel ( CONST_STRPTR drive , CONST_STRPTR newname ) ;
 LONG Inhibit ( CONST_STRPTR name , LONG onoff ) ;
 LONG AddBuffers ( CONST_STRPTR name , LONG number ) ;

 LONG CompareDates ( const struct DateStamp * date1 , const struct DateStamp * date2 ) ;
 LONG DateToStr ( struct DateTime * datetime ) ;
 LONG StrToDate ( struct DateTime * datetime ) ;

 BPTR InternalLoadSeg ( BPTR fh , BPTR table , const LONG * funcarray , LONG * stack ) ;
 BOOL InternalUnLoadSeg ( BPTR seglist , void ( * const freefunc ) ( ) ) ;
 BPTR NewLoadSeg ( CONST_STRPTR file , const struct TagItem * tags ) ;
 BPTR NewLoadSegTagList ( CONST_STRPTR file , const struct TagItem * tags ) ;
 BPTR NewLoadSegTags ( CONST_STRPTR file , ULONG tag1type , ... ) ;
 LONG AddSegment ( CONST_STRPTR name , BPTR seg , LONG system ) ;
 struct Segment * FindSegment ( CONST_STRPTR name , const struct Segment * seg , LONG system ) ;
 LONG RemSegment ( struct Segment * seg ) ;

 LONG CheckSignal ( LONG mask ) ;
 struct RDArgs * ReadArgs ( CONST_STRPTR arg_template , LONG * array , struct RDArgs * args ) ;
 LONG FindArg ( CONST_STRPTR keyword , CONST_STRPTR arg_template ) ;
 LONG ReadItem ( CONST_STRPTR name , LONG maxchars , struct CSource * cSource ) ;
 LONG StrToLong ( CONST_STRPTR string , LONG * value ) ;
 LONG MatchFirst ( CONST_STRPTR pat , struct AnchorPath * anchor ) ;
 LONG MatchNext ( struct AnchorPath * anchor ) ;
 void MatchEnd ( struct AnchorPath * anchor ) ;
 LONG ParsePattern ( CONST_STRPTR pat , STRPTR buf , LONG buflen ) ;
 BOOL MatchPattern ( CONST_STRPTR pat , STRPTR str ) ;
 void FreeArgs ( struct RDArgs * args ) ;
 STRPTR FilePart ( CONST_STRPTR path ) ;
 STRPTR PathPart ( CONST_STRPTR path ) ;
 BOOL AddPart ( STRPTR dirname , CONST_STRPTR filename , ULONG size ) ;

 BOOL StartNotify ( struct NotifyRequest * notify ) ;
 void EndNotify ( struct NotifyRequest * notify ) ;

 BOOL SetVar ( CONST_STRPTR name , CONST_STRPTR buffer , LONG size , LONG flags ) ;
 LONG GetVar ( CONST_STRPTR name , STRPTR buffer , LONG size , LONG flags ) ;
 LONG DeleteVar ( CONST_STRPTR name , ULONG flags ) ;
 struct LocalVar * FindVar ( CONST_STRPTR name , ULONG type ) ;
 LONG CliInitNewcli ( struct DosPacket * dp ) ;
 LONG CliInitRun ( struct DosPacket * dp ) ;
 LONG WriteChars ( CONST_STRPTR buf , ULONG buflen ) ;
 LONG PutStr ( CONST_STRPTR str ) ;
 LONG VPrintf ( CONST_STRPTR format , const APTR argarray ) ;
 LONG Printf ( CONST_STRPTR format , ... ) ;

 LONG ParsePatternNoCase ( CONST_STRPTR pat , UBYTE * buf , LONG buflen ) ;
 BOOL MatchPatternNoCase ( CONST_STRPTR pat , STRPTR str ) ;

 BOOL SameDevice ( BPTR lock1 , BPTR lock2 ) ;





 void ExAllEnd ( BPTR lock , struct ExAllData * buffer , LONG size , LONG data , struct ExAllControl * control ) ;
 BOOL SetOwner ( CONST_STRPTR name , LONG owner_info ) ;
#line 12 "pumpy.h"
 struct base
 {
 struct Library * sys ;
 struct Library * dos ;
 } ;

 extern struct base base ;
#line 3 "ui.h"
 void ui_init ( BPTR ) ;
 void ui_update ( void ) ;
#line 32 "src/ui.c"
 char cb [ 5 ] [ ( 1 + ( ( 16 ) + ( 16 ) / 4 + 1 ) ) ] = { { ' ' , '.' , ' ' , ' ' , ' ' , ' ' , '.' , ' ' , ' ' , ' ' , ' ' , '.' , ' ' , ' ' , ' ' , ' ' , '.' , ' ' , ' ' , ' ' , ' ' , '.' , '\n'