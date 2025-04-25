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
  tail call void @print_path(ptr noundef nonnull %arg, i32 noundef %i3)
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
  %i22 = load i32, ptr @g_qCount, align 4, !tbaa !22
  %i23 = add nsw i32 %i22, 1
  store i32 %i23, ptr @g_qCount, align 4, !tbaa !22
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
  store i32 %i5, ptr %arg, align 4, !tbaa !22
  %i6 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 1
  %i7 = load i32, ptr %i6, align 4, !tbaa !17
  store i32 %i7, ptr %arg1, align 4, !tbaa !22
  %i8 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 2
  %i9 = load i32, ptr %i8, align 8, !tbaa !18
  store i32 %i9, ptr %arg2, align 4, !tbaa !22
  %i10 = getelementptr inbounds %struct._QITEM, ptr %i, i64 0, i32 3
  %i11 = load ptr, ptr %i10, align 8, !tbaa !19
  store ptr %i11, ptr @qHead, align 8, !tbaa !13
  tail call void @free(ptr noundef nonnull %i) #14
  %i12 = load i32, ptr @g_qCount, align 4, !tbaa !22
  %i13 = add nsw i32 %i12, -1
  store i32 %i13, ptr @g_qCount, align 4, !tbaa !22
  br label %bb14

bb14:                                             ; preds = %bb.bb14_crit_edge, %bb4
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @qcount() local_unnamed_addr #8 {
bb:
  %i = load i32, ptr @g_qCount, align 4, !tbaa !22
  ret i32 %i
}

; Function Attrs: nounwind uwtable
define dso_local void @dijkstra(i32 noundef %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  store i32 0, ptr @ch, align 4, !tbaa !22
  %i = load i32, ptr @NUM_NODES, align 4, !tbaa !22
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
  store i32 9999, ptr %i8, align 4, !tbaa !23
  %i9 = load i32, ptr @ch, align 4, !tbaa !22
  %i10 = sext i32 %i9 to i64
  %i11 = getelementptr inbounds %struct._NODE, ptr %i4, i64 %i10, i32 1
  store i32 9999, ptr %i11, align 4, !tbaa !8
  %i12 = load i32, ptr @ch, align 4, !tbaa !22
  %i13 = add nsw i32 %i12, 1
  store i32 %i13, ptr @ch, align 4, !tbaa !22
  %i14 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i15 = icmp slt i32 %i13, %i14
  br i1 %i15, label %bb5.bb5_crit_edge, label %bb16.loopexit, !llvm.loop !24

bb5.bb5_crit_edge:                                ; preds = %bb5
  br label %bb5

bb16.loopexit:                                    ; preds = %bb5
  br label %bb16

bb16:                                             ; preds = %bb.bb16_crit_edge, %bb16.loopexit
  %i17 = icmp eq i32 %arg, %arg1
  br i1 %i17, label %bb18, label %bb20

bb18:                                             ; preds = %bb16
  %i19 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %bb132

bb20:                                             ; preds = %bb16
  %i21 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  %i22 = sext i32 %arg to i64
  %i23 = getelementptr inbounds %struct._NODE, ptr %i21, i64 %i22
  store i32 0, ptr %i23, align 4, !tbaa !23
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
  %i44 = phi ptr [ @qHead, %bb30.bb43_crit_edge ], [ %i42, %bb41 ]
  store ptr %i25, ptr %i44, align 8, !tbaa !13
  %i45 = load i32, ptr @g_qCount, align 4, !tbaa !22
  %i46 = add nsw i32 %i45, 1
  store i32 %i46, ptr @g_qCount, align 4, !tbaa !22
  %i47 = icmp sgt i32 %i45, -1
  br i1 %i47, label %bb51.preheader, label %bb43.bb132_crit_edge

bb43.bb132_crit_edge:                             ; preds = %bb43
  br label %bb132

bb51.preheader:                                   ; preds = %bb43
  br label %bb51

bb48.loopexit:                                    ; preds = %bb125
  br label %bb48

bb48:                                             ; preds = %bb65.bb48_crit_edge, %bb48.loopexit
  %i49 = phi i32 [ %i66, %bb65.bb48_crit_edge ], [ %i126, %bb48.loopexit ]
  %i50 = icmp sgt i32 %i49, 0
  br i1 %i50, label %bb48.bb51_crit_edge, label %bb132.loopexit

bb48.bb51_crit_edge:                              ; preds = %bb48
  br label %bb51

bb51:                                             ; preds = %bb48.bb51_crit_edge, %bb51.preheader
  %i52 = phi i32 [ %i49, %bb48.bb51_crit_edge ], [ %i46, %bb51.preheader ]
  %i53 = load ptr, ptr @qHead, align 8, !tbaa !13
  %i54 = icmp eq ptr %i53, null
  br i1 %i54, label %bb51.bb65_crit_edge, label %bb55

bb51.bb65_crit_edge:                              ; preds = %bb51
  br label %bb65

bb55:                                             ; preds = %bb51
  %i56 = load i32, ptr %i53, align 8, !tbaa !15
  store i32 %i56, ptr @iNode, align 4, !tbaa !22
  %i57 = getelementptr inbounds %struct._QITEM, ptr %i53, i64 0, i32 1
  %i58 = load i32, ptr %i57, align 4, !tbaa !17
  store i32 %i58, ptr @iDist, align 4, !tbaa !22
  %i59 = getelementptr inbounds %struct._QITEM, ptr %i53, i64 0, i32 2
  %i60 = load i32, ptr %i59, align 8, !tbaa !18
  store i32 %i60, ptr @iPrev, align 4, !tbaa !22
  %i61 = getelementptr inbounds %struct._QITEM, ptr %i53, i64 0, i32 3
  %i62 = load ptr, ptr %i61, align 8, !tbaa !19
  store ptr %i62, ptr @qHead, align 8, !tbaa !13
  tail call void @free(ptr noundef nonnull %i53) #14
  %i63 = load i32, ptr @g_qCount, align 4, !tbaa !22
  %i64 = add nsw i32 %i63, -1
  store i32 %i64, ptr @g_qCount, align 4, !tbaa !22
  br label %bb65

bb65:                                             ; preds = %bb51.bb65_crit_edge, %bb55
  %i66 = phi i32 [ %i52, %bb51.bb65_crit_edge ], [ %i64, %bb55 ]
  store i32 0, ptr @i, align 4, !tbaa !22
  %i67 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i68 = icmp sgt i32 %i67, 0
  br i1 %i68, label %bb69, label %bb65.bb48_crit_edge, !llvm.loop !25

bb65.bb48_crit_edge:                              ; preds = %bb65
  br label %bb48

bb69:                                             ; preds = %bb65
  %i70 = load ptr, ptr @AdjMatrix, align 8, !tbaa !13
  %i71 = load ptr, ptr @rgnNodes, align 8
  %i72 = load i32, ptr @iNode, align 4, !tbaa !22
  br label %bb73

bb73:                                             ; preds = %bb125.bb73_crit_edge, %bb69
  %i74 = phi i32 [ %i66, %bb69 ], [ %i126, %bb125.bb73_crit_edge ]
  %i75 = phi i32 [ %i67, %bb69 ], [ %i127, %bb125.bb73_crit_edge ]
  %i76 = phi i32 [ %i72, %bb69 ], [ %i129, %bb125.bb73_crit_edge ]
  %i77 = phi i32 [ 0, %bb69 ], [ %i130, %bb125.bb73_crit_edge ]
  %i78 = mul nsw i32 %i76, %i75
  %i79 = add nsw i32 %i78, %i77
  %i80 = sext i32 %i79 to i64
  %i81 = getelementptr inbounds i32, ptr %i70, i64 %i80
  %i82 = load i32, ptr %i81, align 4, !tbaa !22
  store i32 %i82, ptr @iCost, align 4, !tbaa !22
  %i83 = icmp eq i32 %i82, 9999
  br i1 %i83, label %bb73.bb125_crit_edge, label %bb84

bb73.bb125_crit_edge:                             ; preds = %bb73
  br label %bb125

bb84:                                             ; preds = %bb73
  %i85 = sext i32 %i77 to i64
  %i86 = getelementptr inbounds %struct._NODE, ptr %i71, i64 %i85
  %i87 = load i32, ptr %i86, align 4, !tbaa !23
  %i88 = icmp eq i32 %i87, 9999
  %i89 = load i32, ptr @iDist, align 4, !tbaa !22
  %i90 = add nsw i32 %i89, %i82
  %i91 = icmp sgt i32 %i87, %i90
  %i92 = select i1 %i88, i1 true, i1 %i91
  br i1 %i92, label %bb93, label %bb84.bb125_crit_edge

bb84.bb125_crit_edge:                             ; preds = %bb84
  br label %bb125

bb93:                                             ; preds = %bb84
  store i32 %i90, ptr %i86, align 4, !tbaa !23
  %i94 = load i32, ptr @iNode, align 4, !tbaa !22
  %i95 = load i32, ptr @i, align 4, !tbaa !22
  %i96 = sext i32 %i95 to i64
  %i97 = getelementptr inbounds %struct._NODE, ptr %i71, i64 %i96, i32 1
  store i32 %i94, ptr %i97, align 4, !tbaa !8
  %i98 = load i32, ptr @i, align 4, !tbaa !22
  %i99 = load i32, ptr @iDist, align 4, !tbaa !22
  %i100 = load i32, ptr @iCost, align 4, !tbaa !22
  %i101 = tail call noalias dereferenceable_or_null(24) ptr @malloc(i64 noundef 24) #11
  %i102 = icmp eq ptr %i101, null
  br i1 %i102, label %bb103, label %bb106

bb103:                                            ; preds = %bb93
  %i104 = load ptr, ptr @stderr, align 8, !tbaa !13
  %i105 = tail call i64 @fwrite(ptr nonnull @.str.1, i64 15, i64 1, ptr %i104) #12
  tail call void @exit(i32 noundef 1) #13
  unreachable

bb106:                                            ; preds = %bb93
  %i107 = add nsw i32 %i100, %i99
  %i108 = load ptr, ptr @qHead, align 8, !tbaa !13
  store i32 %i98, ptr %i101, align 8, !tbaa !15
  %i109 = getelementptr inbounds %struct._QITEM, ptr %i101, i64 0, i32 1
  store i32 %i107, ptr %i109, align 4, !tbaa !17
  %i110 = getelementptr inbounds %struct._QITEM, ptr %i101, i64 0, i32 2
  store i32 %i94, ptr %i110, align 8, !tbaa !18
  %i111 = getelementptr inbounds %struct._QITEM, ptr %i101, i64 0, i32 3
  store ptr null, ptr %i111, align 8, !tbaa !19
  %i112 = icmp eq ptr %i108, null
  br i1 %i112, label %bb106.bb120_crit_edge, label %bb113.preheader

bb106.bb120_crit_edge:                            ; preds = %bb106
  br label %bb120

bb113.preheader:                                  ; preds = %bb106
  br label %bb113

bb113:                                            ; preds = %bb113.bb113_crit_edge, %bb113.preheader
  %i114 = phi ptr [ %i116, %bb113.bb113_crit_edge ], [ %i108, %bb113.preheader ]
  %i115 = getelementptr inbounds %struct._QITEM, ptr %i114, i64 0, i32 3
  %i116 = load ptr, ptr %i115, align 8, !tbaa !19
  %i117 = icmp eq ptr %i116, null
  br i1 %i117, label %bb118, label %bb113.bb113_crit_edge, !llvm.loop !20

bb113.bb113_crit_edge:                            ; preds = %bb113
  br label %bb113

bb118:                                            ; preds = %bb113
  %i119 = getelementptr inbounds %struct._QITEM, ptr %i114, i64 0, i32 3
  br label %bb120

bb120:                                            ; preds = %bb106.bb120_crit_edge, %bb118
  %i121 = phi ptr [ @qHead, %bb106.bb120_crit_edge ], [ %i119, %bb118 ]
  store ptr %i101, ptr %i121, align 8, !tbaa !13
  %i122 = load i32, ptr @g_qCount, align 4, !tbaa !22
  %i123 = add nsw i32 %i122, 1
  store i32 %i123, ptr @g_qCount, align 4, !tbaa !22
  %i124 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  br label %bb125

bb125:                                            ; preds = %bb84.bb125_crit_edge, %bb73.bb125_crit_edge, %bb120
  %i126 = phi i32 [ %i74, %bb73.bb125_crit_edge ], [ %i123, %bb120 ], [ %i74, %bb84.bb125_crit_edge ]
  %i127 = phi i32 [ %i75, %bb73.bb125_crit_edge ], [ %i124, %bb120 ], [ %i75, %bb84.bb125_crit_edge ]
  %i128 = phi i32 [ %i77, %bb73.bb125_crit_edge ], [ %i98, %bb120 ], [ %i77, %bb84.bb125_crit_edge ]
  %i129 = phi i32 [ %i76, %bb73.bb125_crit_edge ], [ %i94, %bb120 ], [ %i76, %bb84.bb125_crit_edge ]
  %i130 = add nsw i32 %i128, 1
  store i32 %i130, ptr @i, align 4, !tbaa !22
  %i131 = icmp slt i32 %i130, %i127
  br i1 %i131, label %bb125.bb73_crit_edge, label %bb48.loopexit, !llvm.loop !26

bb125.bb73_crit_edge:                             ; preds = %bb125
  br label %bb73

bb132.loopexit:                                   ; preds = %bb48
  br label %bb132

bb132:                                            ; preds = %bb43.bb132_crit_edge, %bb132.loopexit, %bb18
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
  %i22 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i23 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef %i22)
  %i24 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i25 = add nsw i32 %i24, 1
  %i26 = shl nsw i32 %i25, 2
  %i27 = mul nsw i32 %i26, %i25
  %i28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef %i27)
  %i29 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i30 = shl i32 %i29, 3
  %i31 = add i32 %i30, 8
  %i32 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, i32 noundef %i31)
  %i33 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i34 = add nsw i32 %i33, 1
  %i35 = sext i32 %i34 to i64
  %i36 = shl nsw i64 %i35, 2
  %i37 = mul i64 %i36, %i35
  %i38 = call noalias ptr @malloc(i64 noundef %i37) #11
  store ptr %i38, ptr @AdjMatrix, align 8, !tbaa !13
  %i39 = shl nsw i64 %i35, 3
  %i40 = call noalias ptr @malloc(i64 noundef %i39) #11
  store ptr %i40, ptr @rgnNodes, align 8, !tbaa !13
  %i41 = icmp sgt i32 %i33, 0
  br i1 %i41, label %bb42.preheader, label %bb15.bb96_crit_edge

bb15.bb96_crit_edge:                              ; preds = %bb15
  br label %bb96

bb42.preheader:                                   ; preds = %bb15
  br label %bb42

bb42:                                             ; preds = %bb60.bb42_crit_edge, %bb42.preheader
  %i43 = phi ptr [ %i61, %bb60.bb42_crit_edge ], [ %i38, %bb42.preheader ]
  %i44 = phi i32 [ %i62, %bb60.bb42_crit_edge ], [ %i33, %bb42.preheader ]
  %i45 = phi i32 [ %i63, %bb60.bb42_crit_edge ], [ 0, %bb42.preheader ]
  %i46 = icmp sgt i32 %i44, 0
  br i1 %i46, label %bb47.preheader, label %bb42.bb60_crit_edge

bb42.bb60_crit_edge:                              ; preds = %bb42
  br label %bb60

bb47.preheader:                                   ; preds = %bb42
  br label %bb47

bb47:                                             ; preds = %bb47.bb47_crit_edge, %bb47.preheader
  %i48 = phi i32 [ %i57, %bb47.bb47_crit_edge ], [ 0, %bb47.preheader ]
  %i49 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i20, ptr noundef nonnull @.str.10, ptr noundef nonnull %i) #14
  %i50 = load i32, ptr %i, align 4, !tbaa !22
  %i51 = load ptr, ptr @AdjMatrix, align 8, !tbaa !13
  %i52 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i53 = mul nsw i32 %i52, %i45
  %i54 = add nsw i32 %i53, %i48
  %i55 = sext i32 %i54 to i64
  %i56 = getelementptr inbounds i32, ptr %i51, i64 %i55
  store i32 %i50, ptr %i56, align 4, !tbaa !22
  %i57 = add nuw nsw i32 %i48, 1
  %i58 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i59 = icmp slt i32 %i57, %i58
  br i1 %i59, label %bb47.bb47_crit_edge, label %bb60.loopexit, !llvm.loop !27

bb47.bb47_crit_edge:                              ; preds = %bb47
  br label %bb47

bb60.loopexit:                                    ; preds = %bb47
  br label %bb60

bb60:                                             ; preds = %bb42.bb60_crit_edge, %bb60.loopexit
  %i61 = phi ptr [ %i43, %bb42.bb60_crit_edge ], [ %i51, %bb60.loopexit ]
  %i62 = phi i32 [ %i44, %bb42.bb60_crit_edge ], [ %i58, %bb60.loopexit ]
  %i63 = add nuw nsw i32 %i45, 1
  %i64 = icmp slt i32 %i63, %i62
  br i1 %i64, label %bb60.bb42_crit_edge, label %bb65, !llvm.loop !28

bb60.bb42_crit_edge:                              ; preds = %bb60
  br label %bb42

bb65:                                             ; preds = %bb60
  %i66 = icmp sgt i32 %i62, 0
  br i1 %i66, label %bb67, label %bb65.bb96_crit_edge

bb65.bb96_crit_edge:                              ; preds = %bb65
  br label %bb96

bb67:                                             ; preds = %bb65
  %i68 = lshr i32 %i62, 1
  br label %bb69

bb69:                                             ; preds = %bb81.bb69_crit_edge, %bb67
  %i70 = phi i32 [ %i92, %bb81.bb69_crit_edge ], [ %i62, %bb67 ]
  %i71 = phi i32 [ %i90, %bb81.bb69_crit_edge ], [ 0, %bb67 ]
  %i72 = phi i32 [ %i91, %bb81.bb69_crit_edge ], [ %i68, %bb67 ]
  %i73 = srem i32 %i72, %i70
  %i74 = load i64, ptr %i2, align 8, !tbaa !29
  %i75 = icmp sgt i64 %i74, 0
  br i1 %i75, label %bb76.preheader, label %bb69.bb81_crit_edge

bb69.bb81_crit_edge:                              ; preds = %bb69
  br label %bb81

bb76.preheader:                                   ; preds = %bb69
  br label %bb76

bb76:                                             ; preds = %bb76.bb76_crit_edge, %bb76.preheader
  %i77 = phi i64 [ %i78, %bb76.bb76_crit_edge ], [ 0, %bb76.preheader ]
  call void @dijkstra(i32 noundef %i71, i32 noundef %i73)
  %i78 = add nuw nsw i64 %i77, 1
  %i79 = load i64, ptr %i2, align 8, !tbaa !29
  %i80 = icmp slt i64 %i78, %i79
  br i1 %i80, label %bb76.bb76_crit_edge, label %bb81.loopexit, !llvm.loop !31

bb76.bb76_crit_edge:                              ; preds = %bb76
  br label %bb76

bb81.loopexit:                                    ; preds = %bb76
  br label %bb81

bb81:                                             ; preds = %bb69.bb81_crit_edge, %bb81.loopexit
  %i82 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  %i83 = sext i32 %i73 to i64
  %i84 = getelementptr inbounds %struct._NODE, ptr %i82, i64 %i83
  %i85 = load i32, ptr %i84, align 4, !tbaa !23
  %i86 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef %i85)
  %i87 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15)
  %i88 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  call void @print_path(ptr noundef %i88, i32 noundef %i73)
  %i89 = call i32 @putchar(i32 10)
  %i90 = add nuw nsw i32 %i71, 1
  %i91 = add nsw i32 %i73, 1
  %i92 = load i32, ptr @NUM_NODES, align 4, !tbaa !22
  %i93 = icmp slt i32 %i90, %i92
  br i1 %i93, label %bb81.bb69_crit_edge, label %bb94, !llvm.loop !32

bb81.bb69_crit_edge:                              ; preds = %bb81
  br label %bb69

bb94:                                             ; preds = %bb81
  %i95 = load ptr, ptr @AdjMatrix, align 8, !tbaa !13
  br label %bb96

bb96:                                             ; preds = %bb65.bb96_crit_edge, %bb15.bb96_crit_edge, %bb94
  %i97 = phi ptr [ %i95, %bb94 ], [ %i61, %bb65.bb96_crit_edge ], [ %i38, %bb15.bb96_crit_edge ]
  call void @free(ptr noundef %i97) #14
  %i98 = load ptr, ptr @rgnNodes, align 8, !tbaa !13
  call void @free(ptr noundef %i98) #14
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!10, !10, i64 0}
!23 = !{!9, !10, i64 0}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
!27 = distinct !{!27, !21}
!28 = distinct !{!28, !21}
!29 = !{!30, !30, i64 0}
!30 = !{!"long", !11, i64 0}
!31 = distinct !{!31, !21}
!32 = distinct !{!32, !21}
