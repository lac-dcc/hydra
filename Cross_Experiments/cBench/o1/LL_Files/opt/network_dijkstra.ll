; ModuleID = 'network_dijkstra.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._NODE = type { i32, i32 }
%struct._QITEM = type { i32, i32, i32, ptr }

@NUM_NODES = dso_local global i32 0, align 4
@qHead = dso_local local_unnamed_addr global ptr null, align 8
@g_qCount = dso_local local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external local_unnamed_addr global ptr, align 8
@stderr = external local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = dso_local local_unnamed_addr global i32 0, align 4
@rgnNodes = dso_local local_unnamed_addr global ptr null, align 8
@iNode = dso_local local_unnamed_addr global i32 0, align 4
@iDist = dso_local local_unnamed_addr global i32 0, align 4
@iPrev = dso_local local_unnamed_addr global i32 0, align 4
@i = dso_local local_unnamed_addr global i32 0, align 4
@AdjMatrix = dso_local local_unnamed_addr global ptr null, align 8
@iCost = dso_local local_unnamed_addr global i32 0, align 4
@.str.3 = private unnamed_addr constant [28 x i8] c"Usage: dijkstra <filename>\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"Only supports matrix size is #define'd.\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"Matrix size: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"AdjMatrix size: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"rgnNodesSize: %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [30 x i8] c"Shortest path is %d in cost. \00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"Path is: \00", align 1
@str = private unnamed_addr constant [53 x i8] c"Shortest path is 0 in cost. Just stay where you are.\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_path(ptr nocapture noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = sext i32 %arg1 to i64
  %i2 = getelementptr inbounds %struct._NODE, ptr %arg, i64 %i, i32 1
  %i3 = load i32, ptr %i2, align 4, !tbaa !8
  %i4 = icmp eq i32 %i3, 9999
  br i1 %i4, label %bb.bb6_crit_edge, label %bb5

bb.bb6_crit_edge:                                 ; preds = %bb
  br label %bb6

bb5:                                              ; preds = %bb
  tail call void @print_path(ptr noundef %arg, i32 noundef %i3)
  br label %bb6

bb6:                                              ; preds = %bb.bb6_crit_edge, %bb5
  %i7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %arg1)
  %i8 = load ptr, ptr @stdout, align 8, !tbaa !13
  %i9 = tail call i32 @fflush(ptr noundef %i8)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @fflush(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @enqueue(i32 noundef %arg, i32 noundef %arg1, i32 noundef %arg2) local_unnamed_addr #2 {
bb:
  %i = tail call noalias dereferenceable_or_null(24) ptr @malloc(i64 noundef 24) #11
  %i3 = icmp eq ptr %i, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.1, i64 15, i64 1, ptr %i5) #12
  tail call void @exit(i32 noundef 1) #13
  unreachable

bb7:                                              ; preds = %bb
  %i8 = load ptr, ptr @qHead, align 8, !tbaa !13
  store i32 %arg, ptr %i, align 8, !tbaa !15
  %i9 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 1
  store i32 %arg1, ptr %i9, align 4, !tbaa !17
  %i10 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 2
  store i32 %arg2, ptr %i10, align 8, !tbaa !18
  %i11 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 3
  store ptr null, ptr %i11, align 8, !tbaa !19
  %i12 = icmp eq ptr %i8, null
  br i1 %i12, label %bb7.bb20_crit_edge, label %bb13.preheader

bb7.bb20_crit_edge:                               ; preds = %bb7
  br label %bb20

bb13.preheader:                                   ; preds = %bb7
  br label %bb13

bb13:                                             ; preds = %bb13.bb13_crit_edge, %bb13.preheader
  %i14 = phi ptr [ %i16, %bb13.bb13_crit_edge ], [ %i8, %bb13.preheader ]
  %i15 = getelementptr inbounds %struct._QITEM, ptr %i14, i64 0, i32 3
  %i16 = load ptr, ptr %i15, align 8, !tbaa !19
  %i17 = icmp eq ptr %i16, null
  br i1 %i17, label %bb18, label %bb13.bb13_crit_edge, !llvm.loop !20

bb13.bb13_crit_edge:                              ; preds = %bb13
  br label %bb13

bb18:                                             ; preds = %bb13
  %i19 = getelementptr inbounds %struct._QITEM, ptr %i14, i64 0, i32 3
  br label %bb20

bb20:                                             ; preds = %bb7.bb20_crit_edge, %bb18
  %i21 = phi ptr [ %i19, %bb18 ], [ @qHead, %bb7.bb20_crit_edge ]
  store ptr %i, ptr %i21, align 8, !tbaa !13
  %i22 = load i32, ptr @g_qCount, align 4, !tbaa !23
  %i23 = add nsw i32 %i22, 1
  store i32 %i23, ptr @g_qCount, align 4, !tbaa !23
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nounwind willreturn uwtable
define dso_local void @dequeue(ptr nocapture noundef writeonly %arg, ptr nocapture noundef writeonly %arg1, ptr nocapture noundef writeonly %arg2) local_unnamed_addr #6 {
bb:
  %i = load ptr, ptr @qHead, align 8, !tbaa !13
  %i3 = icmp eq ptr %i, null
  br i1 %i3, label %bb.bb14_crit_edge, label %bb4

bb.bb14_crit_edge:                                ; preds = %bb
  br label %bb14

bb4:                                              ; preds = %bb
  %i5 = load i32, ptr %i, align 8, !tbaa !15
  store i32 %i5, ptr %arg, align 4, !tbaa !23
  %i6 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 1
  %i7 = load i32, ptr %i6, align 4, !tbaa !17
  store i32 %i7, ptr %arg1, align 4, !tbaa !23
  %i8 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 2
  %i9 = load i32, ptr %i8, align 8, !tbaa !18
  store i32 %i9, ptr %arg2, align 4, !tbaa !23
  %i10 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 3
  %i11 = load ptr, ptr %i10, align 8, !tbaa !19
  store ptr %i11, ptr @qHead, align 8, !tbaa !13
  tail call void @free(ptr noundef %i) #14
  %i12 = load i32, ptr @g_qCount, align 4, !tbaa !23
  %i13 = add nsw i32 %i12, -1
  store i32 %i13, ptr @g_qCount, align 4, !tbaa !23
  br label %bb14

bb14:                                             ; preds = %bb.bb14_crit_edge, %bb4
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @qcount() local_unnamed_addr #8 {
bb:
  %i = load i32, ptr @g_qCount, align 4, !tbaa !23
  ret i32 %i
}

; Function Attrs: nounwind uwtable
define dso_local void @dijkstra(i32 noundef %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  store i32 0, ptr @ch, align 4, !tbaa !23
  %i = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i2 = icmp sgt i32 %i, 0
  br i1 %i2, label %bb3, label %bb.bb16_crit_edge

bb.bb16_crit_edge:                                ; preds = %bb
  br label %bb16

bb3:                                              ; preds = %bb
  %i4 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  br label %bb5

bb5:                                              ; preds = %bb5.bb5_crit_edge, %bb3
  %i6 = phi i32 [ 0, %bb3 ], [ %i13, %bb5.bb5_crit_edge ]
  %i7 = sext i32 %i6 to i64
  %i8 = getelementptr inbounds %struct._NODE, ptr %i4, i64 %i7
  store i32 9999, ptr %i8, align 4, !tbaa !24
  %i9 = load i32, ptr @ch, align 4, !tbaa !23
  %i10 = sext i32 %i9 to i64
  %i11 = getelementptr inbounds %struct._NODE, ptr %i4, i64 %i10, i32 1
  store i32 9999, ptr %i11, align 4, !tbaa !8
  %i12 = load i32, ptr @ch, align 4, !tbaa !23
  %i13 = add nsw i32 %i12, 1
  store i32 %i13, ptr @ch, align 4, !tbaa !23
  %i14 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i15 = icmp slt i32 %i13, %i14
  br i1 %i15, label %bb5.bb5_crit_edge, label %bb16.loopexit, !llvm.loop !25

bb5.bb5_crit_edge:                                ; preds = %bb5
  br label %bb5

bb16.loopexit:                                    ; preds = %bb5
  br label %bb16

bb16:                                             ; preds = %bb.bb16_crit_edge, %bb16.loopexit
  %i17 = icmp eq i32 %arg, %arg1
  br i1 %i17, label %bb18, label %bb20

bb18:                                             ; preds = %bb16
  %i19 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %bb131

bb20:                                             ; preds = %bb16
  %i21 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  %i22 = sext i32 %arg to i64
  %i23 = getelementptr inbounds %struct._NODE, ptr %i21, i64 %i22
  store i32 0, ptr %i23, align 4, !tbaa !24
  %i24 = getelementptr inbounds %struct._NODE, ptr %i21, i64 %i22, i32 1
  store i32 9999, ptr %i24, align 4, !tbaa !8
  %i25 = tail call noalias dereferenceable_or_null(24) ptr @malloc(i64 noundef 24) #11
  %i26 = icmp eq ptr %i25, null
  br i1 %i26, label %bb27, label %bb30

bb27:                                             ; preds = %bb20
  %i28 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i29 = tail call i64 @fwrite(ptr nonnull @.str.1, i64 15, i64 1, ptr %i28) #12
  tail call void @exit(i32 noundef 1) #13
  unreachable

bb30:                                             ; preds = %bb20
  %i31 = load ptr, ptr @qHead, align 8, !tbaa !13
  store i32 %arg, ptr %i25, align 8, !tbaa !15
  %i32 = getelementptr inbounds %struct._QITEM, ptr %i25, i64 0, i32 1
  store i32 0, ptr %i32, align 4, !tbaa !17
  %i33 = getelementptr inbounds %struct._QITEM, ptr %i25, i64 0, i32 2
  store i32 9999, ptr %i33, align 8, !tbaa !18
  %i34 = getelementptr inbounds %struct._QITEM, ptr %i25, i64 0, i32 3
  store ptr null, ptr %i34, align 8, !tbaa !19
  %i35 = icmp eq ptr %i31, null
  br i1 %i35, label %bb30.bb43_crit_edge, label %bb36.preheader

bb30.bb43_crit_edge:                              ; preds = %bb30
  br label %bb43

bb36.preheader:                                   ; preds = %bb30
  br label %bb36

bb36:                                             ; preds = %bb36.bb36_crit_edge, %bb36.preheader
  %i37 = phi ptr [ %i39, %bb36.bb36_crit_edge ], [ %i31, %bb36.preheader ]
  %i38 = getelementptr inbounds %struct._QITEM, ptr %i37, i64 0, i32 3
  %i39 = load ptr, ptr %i38, align 8, !tbaa !19
  %i40 = icmp eq ptr %i39, null
  br i1 %i40, label %bb41, label %bb36.bb36_crit_edge, !llvm.loop !20

bb36.bb36_crit_edge:                              ; preds = %bb36
  br label %bb36

bb41:                                             ; preds = %bb36
  %i42 = getelementptr inbounds %struct._QITEM, ptr %i37, i64 0, i32 3
  br label %bb43

bb43:                                             ; preds = %bb30.bb43_crit_edge, %bb41
  %i44 = phi ptr [ %i42, %bb41 ], [ @qHead, %bb30.bb43_crit_edge ]
  store ptr %i25, ptr %i44, align 8, !tbaa !13
  %i45 = load i32, ptr @g_qCount, align 4, !tbaa !23
  %i46 = add nsw i32 %i45, 1
  store i32 %i46, ptr @g_qCount, align 4, !tbaa !23
  %i47 = icmp sgt i32 %i45, -1
  br i1 %i47, label %bb51.preheader, label %bb43.bb131_crit_edge

bb43.bb131_crit_edge:                             ; preds = %bb43
  br label %bb131

bb51.preheader:                                   ; preds = %bb43
  br label %bb51

bb48.loopexit:                                    ; preds = %bb125
  br label %bb48

bb48:                                             ; preds = %bb64.bb48_crit_edge, %bb48.loopexit
  %i49 = load i32, ptr @g_qCount, align 4, !tbaa !23
  %i50 = icmp sgt i32 %i49, 0
  br i1 %i50, label %bb48.bb51_crit_edge, label %bb131.loopexit, !llvm.loop !26

bb48.bb51_crit_edge:                              ; preds = %bb48
  br label %bb51

bb51:                                             ; preds = %bb48.bb51_crit_edge, %bb51.preheader
  %i52 = load ptr, ptr @qHead, align 8, !tbaa !13
  %i53 = icmp eq ptr %i52, null
  br i1 %i53, label %bb51.bb64_crit_edge, label %bb54

bb51.bb64_crit_edge:                              ; preds = %bb51
  br label %bb64

bb54:                                             ; preds = %bb51
  %i55 = load i32, ptr %i52, align 8, !tbaa !15
  store i32 %i55, ptr @iNode, align 4, !tbaa !23
  %i56 = getelementptr inbounds %struct._QITEM, ptr %i52, i64 0, i32 1
  %i57 = load i32, ptr %i56, align 4, !tbaa !17
  store i32 %i57, ptr @iDist, align 4, !tbaa !23
  %i58 = getelementptr inbounds %struct._QITEM, ptr %i52, i64 0, i32 2
  %i59 = load i32, ptr %i58, align 8, !tbaa !18
  store i32 %i59, ptr @iPrev, align 4, !tbaa !23
  %i60 = getelementptr inbounds %struct._QITEM, ptr %i52, i64 0, i32 3
  %i61 = load ptr, ptr %i60, align 8, !tbaa !19
  store ptr %i61, ptr @qHead, align 8, !tbaa !13
  tail call void @free(ptr noundef %i52) #14
  %i62 = load i32, ptr @g_qCount, align 4, !tbaa !23
  %i63 = add nsw i32 %i62, -1
  store i32 %i63, ptr @g_qCount, align 4, !tbaa !23
  br label %bb64

bb64:                                             ; preds = %bb51.bb64_crit_edge, %bb54
  %i65 = load ptr, ptr @qHead, align 8, !tbaa !13
  store i32 0, ptr @i, align 4, !tbaa !23
  %i66 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i67 = icmp sgt i32 %i66, 0
  br i1 %i67, label %bb68, label %bb64.bb48_crit_edge

bb64.bb48_crit_edge:                              ; preds = %bb64
  br label %bb48

bb68:                                             ; preds = %bb64
  %i69 = load ptr, ptr @AdjMatrix, align 8, !tbaa !13
  %i70 = load ptr, ptr @rgnNodes, align 8
  br label %bb71

bb71:                                             ; preds = %bb125.bb71_crit_edge, %bb68
  %i72 = phi i32 [ %i66, %bb68 ], [ %i129, %bb125.bb71_crit_edge ]
  %i73 = phi i32 [ 0, %bb68 ], [ %i128, %bb125.bb71_crit_edge ]
  %i74 = phi ptr [ %i65, %bb68 ], [ %i126, %bb125.bb71_crit_edge ]
  %i75 = load i32, ptr @iNode, align 4, !tbaa !23
  %i76 = mul nsw i32 %i75, %i72
  %i77 = add nsw i32 %i76, %i73
  %i78 = sext i32 %i77 to i64
  %i79 = getelementptr inbounds i32, ptr %i69, i64 %i78
  %i80 = load i32, ptr %i79, align 4, !tbaa !23
  store i32 %i80, ptr @iCost, align 4, !tbaa !23
  %i81 = icmp eq i32 %i80, 9999
  br i1 %i81, label %bb71.bb125_crit_edge, label %bb82

bb71.bb125_crit_edge:                             ; preds = %bb71
  br label %bb125

bb82:                                             ; preds = %bb71
  %i83 = sext i32 %i73 to i64
  %i84 = getelementptr inbounds %struct._NODE, ptr %i70, i64 %i83
  %i85 = load i32, ptr %i84, align 4, !tbaa !24
  %i86 = icmp eq i32 %i85, 9999
  br i1 %i86, label %bb82.bb91_crit_edge, label %bb87

bb82.bb91_crit_edge:                              ; preds = %bb82
  br label %bb91

bb87:                                             ; preds = %bb82
  %i88 = load i32, ptr @iDist, align 4, !tbaa !23
  %i89 = add nsw i32 %i88, %i80
  %i90 = icmp sgt i32 %i85, %i89
  br i1 %i90, label %bb87.bb91_crit_edge, label %bb87.bb125_crit_edge

bb87.bb125_crit_edge:                             ; preds = %bb87
  br label %bb125

bb87.bb91_crit_edge:                              ; preds = %bb87
  br label %bb91

bb91:                                             ; preds = %bb87.bb91_crit_edge, %bb82.bb91_crit_edge
  %i92 = load i32, ptr @iDist, align 4, !tbaa !23
  %i93 = add nsw i32 %i92, %i80
  store i32 %i93, ptr %i84, align 4, !tbaa !24
  %i94 = load i32, ptr @iNode, align 4, !tbaa !23
  %i95 = load i32, ptr @i, align 4, !tbaa !23
  %i96 = sext i32 %i95 to i64
  %i97 = getelementptr inbounds %struct._NODE, ptr %i70, i64 %i96, i32 1
  store i32 %i94, ptr %i97, align 4, !tbaa !8
  %i98 = load i32, ptr @i, align 4, !tbaa !23
  %i99 = load i32, ptr @iDist, align 4, !tbaa !23
  %i100 = load i32, ptr @iCost, align 4, !tbaa !23
  %i101 = load i32, ptr @iNode, align 4, !tbaa !23
  %i102 = tail call noalias dereferenceable_or_null(24) ptr @malloc(i64 noundef 24) #11
  %i103 = icmp eq ptr %i102, null
  br i1 %i103, label %bb104, label %bb107

bb104:                                            ; preds = %bb91
  %i105 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i106 = tail call i64 @fwrite(ptr nonnull @.str.1, i64 15, i64 1, ptr %i105) #12
  tail call void @exit(i32 noundef 1) #13
  unreachable

bb107:                                            ; preds = %bb91
  %i108 = add nsw i32 %i100, %i99
  store i32 %i98, ptr %i102, align 8, !tbaa !15
  %i109 = getelementptr inbounds %struct._QITEM, ptr %i102, i64 0, i32 1
  store i32 %i108, ptr %i109, align 4, !tbaa !17
  %i110 = getelementptr inbounds %struct._QITEM, ptr %i102, i64 0, i32 2
  store i32 %i101, ptr %i110, align 8, !tbaa !18
  %i111 = getelementptr inbounds %struct._QITEM, ptr %i102, i64 0, i32 3
  store ptr null, ptr %i111, align 8, !tbaa !19
  %i112 = icmp eq ptr %i74, null
  br i1 %i112, label %bb107.bb120_crit_edge, label %bb113.preheader

bb107.bb120_crit_edge:                            ; preds = %bb107
  br label %bb120

bb113.preheader:                                  ; preds = %bb107
  br label %bb113

bb113:                                            ; preds = %bb113.bb113_crit_edge, %bb113.preheader
  %i114 = phi ptr [ %i116, %bb113.bb113_crit_edge ], [ %i74, %bb113.preheader ]
  %i115 = getelementptr inbounds %struct._QITEM, ptr %i114, i64 0, i32 3
  %i116 = load ptr, ptr %i115, align 8, !tbaa !19
  %i117 = icmp eq ptr %i116, null
  br i1 %i117, label %bb118, label %bb113.bb113_crit_edge, !llvm.loop !20

bb113.bb113_crit_edge:                            ; preds = %bb113
  br label %bb113

bb118:                                            ; preds = %bb113
  %i119 = getelementptr inbounds %struct._QITEM, ptr %i114, i64 0, i32 3
  br label %bb120

bb120:                                            ; preds = %bb107.bb120_crit_edge, %bb118
  %i121 = phi ptr [ %i119, %bb118 ], [ @qHead, %bb107.bb120_crit_edge ]
  %i122 = phi ptr [ %i74, %bb118 ], [ %i102, %bb107.bb120_crit_edge ]
  store ptr %i102, ptr %i121, align 8, !tbaa !13
  %i123 = load i32, ptr @g_qCount, align 4, !tbaa !23
  %i124 = add nsw i32 %i123, 1
  store i32 %i124, ptr @g_qCount, align 4, !tbaa !23
  br label %bb125

bb125:                                            ; preds = %bb87.bb125_crit_edge, %bb71.bb125_crit_edge, %bb120
  %i126 = phi ptr [ %i74, %bb71.bb125_crit_edge ], [ %i122, %bb120 ], [ %i74, %bb87.bb125_crit_edge ]
  %i127 = load i32, ptr @i, align 4, !tbaa !23
  %i128 = add nsw i32 %i127, 1
  store i32 %i128, ptr @i, align 4, !tbaa !23
  %i129 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i130 = icmp slt i32 %i128, %i129
  br i1 %i130, label %bb125.bb71_crit_edge, label %bb48.loopexit, !llvm.loop !27

bb125.bb71_crit_edge:                             ; preds = %bb125
  br label %bb71

bb131.loopexit:                                   ; preds = %bb48
  br label %bb131

bb131:                                            ; preds = %bb43.bb131_crit_edge, %bb131.loopexit, %bb18
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr nocapture noundef readonly %arg1) local_unnamed_addr #2 {
bb:
  %i = alloca i32, align 4
  %i2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i) #14
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i2) #14
  %i3 = icmp slt i32 %arg, 2
  br i1 %i3, label %bb4, label %bb9

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.3, i64 27, i64 1, ptr %i5) #12
  %i7 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i8 = tail call i64 @fwrite(ptr nonnull @.str.4, i64 40, i64 1, ptr %i7) #12
  tail call void @exit(i32 noundef 1) #13
  unreachable

bb9:                                              ; preds = %bb
  %i10 = tail call noalias ptr @fopen(ptr noundef nonnull @.str.5, ptr noundef nonnull @.str.6)
  %i11 = icmp eq ptr %i10, null
  br i1 %i11, label %bb12, label %bb15

bb12:                                             ; preds = %bb9
  %i13 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i14 = tail call i64 @fwrite(ptr nonnull @.str.7, i64 28, i64 1, ptr %i13) #12
  tail call void @exit(i32 noundef 1) #13
  unreachable

bb15:                                             ; preds = %bb9
  %i16 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i10, ptr noundef nonnull @.str.8, ptr noundef nonnull %i2) #14
  %i17 = call i32 @fclose(ptr noundef nonnull %i10)
  %i18 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i19 = load ptr, ptr %i18, align 8, !tbaa !13
  %i20 = call noalias ptr @fopen(ptr noundef %i19, ptr noundef nonnull @.str.9)
  %i21 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i20, ptr noundef nonnull @.str.10, ptr noundef nonnull @NUM_NODES) #14
  %i22 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i23 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef %i22)
  %i24 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i25 = add nsw i32 %i24, 1
  %i26 = shl nsw i32 %i25, 2
  %i27 = mul nsw i32 %i26, %i25
  %i28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef %i27)
  %i29 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i30 = shl i32 %i29, 3
  %i31 = add i32 %i30, 8
  %i32 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, i32 noundef %i31)
  %i33 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i34 = add nsw i32 %i33, 1
  %i35 = sext i32 %i34 to i64
  %i36 = shl nsw i64 %i35, 2
  %i37 = mul i64 %i36, %i35
  %i38 = call noalias ptr @malloc(i64 noundef %i37) #11
  store ptr %i38, ptr @AdjMatrix, align 8, !tbaa !13
  %i39 = shl nsw i64 %i35, 3
  %i40 = call noalias ptr @malloc(i64 noundef %i39) #11
  store ptr %i40, ptr @rgnNodes, align 8, !tbaa !13
  %i41 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i42 = icmp sgt i32 %i41, 0
  br i1 %i42, label %bb43.preheader, label %bb15.bb64_crit_edge

bb15.bb64_crit_edge:                              ; preds = %bb15
  br label %bb64

bb43.preheader:                                   ; preds = %bb15
  br label %bb43

bb43:                                             ; preds = %bb60.bb43_crit_edge, %bb43.preheader
  %i44 = phi i32 [ %i61, %bb60.bb43_crit_edge ], [ 0, %bb43.preheader ]
  %i45 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i46 = icmp sgt i32 %i45, 0
  br i1 %i46, label %bb47.preheader, label %bb43.bb60_crit_edge

bb43.bb60_crit_edge:                              ; preds = %bb43
  br label %bb60

bb47.preheader:                                   ; preds = %bb43
  br label %bb47

bb47:                                             ; preds = %bb47.bb47_crit_edge, %bb47.preheader
  %i48 = phi i32 [ %i57, %bb47.bb47_crit_edge ], [ 0, %bb47.preheader ]
  %i49 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i20, ptr noundef nonnull @.str.10, ptr noundef nonnull %i) #14
  %i50 = load i32, ptr %i, align 4, !tbaa !23
  %i51 = load ptr, ptr @AdjMatrix, align 8, !tbaa !13
  %i52 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i53 = mul nsw i32 %i52, %i44
  %i54 = add nsw i32 %i53, %i48
  %i55 = sext i32 %i54 to i64
  %i56 = getelementptr inbounds i32, ptr %i51, i64 %i55
  store i32 %i50, ptr %i56, align 4, !tbaa !23
  %i57 = add nuw nsw i32 %i48, 1
  %i58 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i59 = icmp slt i32 %i57, %i58
  br i1 %i59, label %bb47.bb47_crit_edge, label %bb60.loopexit, !llvm.loop !28

bb47.bb47_crit_edge:                              ; preds = %bb47
  br label %bb47

bb60.loopexit:                                    ; preds = %bb47
  br label %bb60

bb60:                                             ; preds = %bb43.bb60_crit_edge, %bb60.loopexit
  %i61 = add nuw nsw i32 %i44, 1
  %i62 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i63 = icmp slt i32 %i61, %i62
  br i1 %i63, label %bb60.bb43_crit_edge, label %bb64.loopexit, !llvm.loop !29

bb60.bb43_crit_edge:                              ; preds = %bb60
  br label %bb43

bb64.loopexit:                                    ; preds = %bb60
  br label %bb64

bb64:                                             ; preds = %bb15.bb64_crit_edge, %bb64.loopexit
  %i65 = phi i32 [ %i41, %bb15.bb64_crit_edge ], [ %i62, %bb64.loopexit ]
  %i66 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i67 = icmp sgt i32 %i66, 0
  br i1 %i67, label %bb68, label %bb64.bb95_crit_edge

bb64.bb95_crit_edge:                              ; preds = %bb64
  br label %bb95

bb68:                                             ; preds = %bb64
  %i69 = sdiv i32 %i65, 2
  br label %bb70

bb70:                                             ; preds = %bb82.bb70_crit_edge, %bb68
  %i71 = phi i32 [ %i93, %bb82.bb70_crit_edge ], [ %i66, %bb68 ]
  %i72 = phi i32 [ %i91, %bb82.bb70_crit_edge ], [ 0, %bb68 ]
  %i73 = phi i32 [ %i92, %bb82.bb70_crit_edge ], [ %i69, %bb68 ]
  %i74 = srem i32 %i73, %i71
  %i75 = load i64, ptr %i2, align 8, !tbaa !30
  %i76 = icmp sgt i64 %i75, 0
  br i1 %i76, label %bb77.preheader, label %bb70.bb82_crit_edge

bb70.bb82_crit_edge:                              ; preds = %bb70
  br label %bb82

bb77.preheader:                                   ; preds = %bb70
  br label %bb77

bb77:                                             ; preds = %bb77.bb77_crit_edge, %bb77.preheader
  %i78 = phi i64 [ %i79, %bb77.bb77_crit_edge ], [ 0, %bb77.preheader ]
  call void @dijkstra(i32 noundef %i72, i32 noundef %i74)
  %i79 = add nuw nsw i64 %i78, 1
  %i80 = load i64, ptr %i2, align 8, !tbaa !30
  %i81 = icmp slt i64 %i79, %i80
  br i1 %i81, label %bb77.bb77_crit_edge, label %bb82.loopexit, !llvm.loop !32

bb77.bb77_crit_edge:                              ; preds = %bb77
  br label %bb77

bb82.loopexit:                                    ; preds = %bb77
  br label %bb82

bb82:                                             ; preds = %bb70.bb82_crit_edge, %bb82.loopexit
  %i83 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  %i84 = sext i32 %i74 to i64
  %i85 = getelementptr inbounds %struct._NODE, ptr %i83, i64 %i84
  %i86 = load i32, ptr %i85, align 4, !tbaa !24
  %i87 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef %i86)
  %i88 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15)
  %i89 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  call void @print_path(ptr noundef %i89, i32 noundef %i74)
  %i90 = call i32 @putchar(i32 10)
  %i91 = add nuw nsw i32 %i72, 1
  %i92 = add nsw i32 %i74, 1
  %i93 = load i32, ptr @NUM_NODES, align 4, !tbaa !23
  %i94 = icmp slt i32 %i91, %i93
  br i1 %i94, label %bb82.bb70_crit_edge, label %bb95.loopexit, !llvm.loop !33

bb82.bb70_crit_edge:                              ; preds = %bb82
  br label %bb70

bb95.loopexit:                                    ; preds = %bb82
  br label %bb95

bb95:                                             ; preds = %bb64.bb95_crit_edge, %bb95.loopexit
  %i96 = load ptr, ptr @AdjMatrix, align 8, !tbaa !13
  call void @free(ptr noundef %i96) #14
  %i97 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  call void @free(ptr noundef %i97) #14
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i2) #14
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i) #14
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #9

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #9

attributes #0 = { nofree nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nounwind willreturn uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nounwind allocsize(0) }
attributes #12 = { cold }
attributes #13 = { noreturn nounwind }
attributes #14 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = !{!9, !10, i64 4}
!9 = !{!"_NODE", !10, i64 0, !10, i64 4}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !11, i64 0}
!15 = !{!16, !10, i64 0}
!16 = !{!"_QITEM", !10, i64 0, !10, i64 4, !10, i64 8, !14, i64 16}
!17 = !{!16, !10, i64 4}
!18 = !{!16, !10, i64 8}
!19 = !{!16, !14, i64 16}
!20 = distinct !{!20, !21, !22}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = !{!10, !10, i64 0}
!24 = !{!9, !10, i64 0}
!25 = distinct !{!25, !21, !22}
!26 = distinct !{!26, !21, !22}
!27 = distinct !{!27, !21, !22}
!28 = distinct !{!28, !21, !22}
!29 = distinct !{!29, !21, !22}
!30 = !{!31, !31, i64 0}
!31 = !{!"long", !11, i64 0}
!32 = distinct !{!32, !21, !22}
!33 = distinct !{!33, !21, !22}
