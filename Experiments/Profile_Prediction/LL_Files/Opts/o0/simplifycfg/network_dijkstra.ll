; ModuleID = 'network_dijkstra.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._NODE = type { i32, i32 }
%struct._QITEM = type { i32, i32, i32, ptr }

@NUM_NODES = dso_local global i32 0, align 4
@qHead = dso_local global ptr null, align 8
@g_qCount = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external global ptr, align 8
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = dso_local global i32 0, align 4
@rgnNodes = dso_local global ptr null, align 8
@.str.2 = private unnamed_addr constant [54 x i8] c"Shortest path is 0 in cost. Just stay where you are.\0A\00", align 1
@iNode = dso_local global i32 0, align 4
@iDist = dso_local global i32 0, align 4
@iPrev = dso_local global i32 0, align 4
@i = dso_local global i32 0, align 4
@AdjMatrix = dso_local global ptr null, align 8
@iCost = dso_local global i32 0, align 4
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
@.str.16 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_path(ptr noundef %arg, i32 noundef %arg1) #0 {
bb:
  %i = sext i32 %arg1 to i64
  %i2 = getelementptr inbounds %struct._NODE, ptr %arg, i64 %i
  %i3 = getelementptr inbounds %struct._NODE, ptr %i2, i32 0, i32 1
  %i4 = load i32, ptr %i3, align 4
  %i5 = icmp ne i32 %i4, 9999
  br i1 %i5, label %bb6, label %bb.bb11_crit_edge

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb6:                                              ; preds = %bb
  %i7 = sext i32 %arg1 to i64
  %i8 = getelementptr inbounds %struct._NODE, ptr %arg, i64 %i7
  %i9 = getelementptr inbounds %struct._NODE, ptr %i8, i32 0, i32 1
  %i10 = load i32, ptr %i9, align 4
  call void @print_path(ptr noundef %arg, i32 noundef %i10)
  br label %bb11

bb11:                                             ; preds = %bb.bb11_crit_edge, %bb6
  %i12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %arg1)
  %i13 = load ptr, ptr @stdout, align 8
  %i14 = call i32 @fflush(ptr noundef %i13)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @fflush(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @enqueue(i32 noundef %arg, i32 noundef %arg1, i32 noundef %arg2) #0 {
bb:
  %i = call noalias ptr @malloc(i64 noundef 24) #5
  %i3 = load ptr, ptr @qHead, align 8
  %i4 = icmp ne ptr %i, null
  br i1 %i4, label %bb8, label %bb5

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8
  %i7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #6
  unreachable

bb8:                                              ; preds = %bb
  %i9 = getelementptr inbounds %struct._QITEM, ptr %i, i32 0, i32 0
  store i32 %arg, ptr %i9, align 8
  %i10 = getelementptr inbounds %struct._QITEM, ptr %i, i32 0, i32 1
  store i32 %arg1, ptr %i10, align 4
  %i11 = getelementptr inbounds %struct._QITEM, ptr %i, i32 0, i32 2
  store i32 %arg2, ptr %i11, align 8
  %i12 = getelementptr inbounds %struct._QITEM, ptr %i, i32 0, i32 3
  store ptr null, ptr %i12, align 8
  %i13 = icmp ne ptr %i3, null
  br i1 %i13, label %bb16.preheader, label %bb14

bb16.preheader:                                   ; preds = %bb8
  br label %bb16

bb14:                                             ; preds = %bb8
  store ptr %i, ptr @qHead, align 8
  br label %bb25

bb16:                                             ; preds = %bb16.preheader, %bb20
  %.0 = phi ptr [ %i22, %bb20 ], [ %i3, %bb16.preheader ]
  %i17 = getelementptr inbounds %struct._QITEM, ptr %.0, i32 0, i32 3
  %i18 = load ptr, ptr %i17, align 8
  %i19 = icmp ne ptr %i18, null
  br i1 %i19, label %bb20, label %bb23

bb20:                                             ; preds = %bb16
  %i21 = getelementptr inbounds %struct._QITEM, ptr %.0, i32 0, i32 3
  %i22 = load ptr, ptr %i21, align 8
  br label %bb16, !llvm.loop !8

bb23:                                             ; preds = %bb16
  %i24 = getelementptr inbounds %struct._QITEM, ptr %.0, i32 0, i32 3
  store ptr %i, ptr %i24, align 8
  br label %bb25

bb25:                                             ; preds = %bb23, %bb14
  %i26 = load i32, ptr @g_qCount, align 4
  %i27 = add nsw i32 %i26, 1
  store i32 %i27, ptr @g_qCount, align 4
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @dequeue(ptr noundef %arg, ptr noundef %arg1, ptr noundef %arg2) #0 {
bb:
  %i = load ptr, ptr @qHead, align 8
  %i3 = load ptr, ptr @qHead, align 8
  %i4 = icmp ne ptr %i3, null
  br i1 %i4, label %bb5, label %bb.bb20_crit_edge

bb.bb20_crit_edge:                                ; preds = %bb
  br label %bb20

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @qHead, align 8
  %i7 = getelementptr inbounds %struct._QITEM, ptr %i6, i32 0, i32 0
  %i8 = load i32, ptr %i7, align 8
  store i32 %i8, ptr %arg, align 4
  %i9 = load ptr, ptr @qHead, align 8
  %i10 = getelementptr inbounds %struct._QITEM, ptr %i9, i32 0, i32 1
  %i11 = load i32, ptr %i10, align 4
  store i32 %i11, ptr %arg1, align 4
  %i12 = load ptr, ptr @qHead, align 8
  %i13 = getelementptr inbounds %struct._QITEM, ptr %i12, i32 0, i32 2
  %i14 = load i32, ptr %i13, align 8
  store i32 %i14, ptr %arg2, align 4
  %i15 = load ptr, ptr @qHead, align 8
  %i16 = getelementptr inbounds %struct._QITEM, ptr %i15, i32 0, i32 3
  %i17 = load ptr, ptr %i16, align 8
  store ptr %i17, ptr @qHead, align 8
  call void @free(ptr noundef %i) #7
  %i18 = load i32, ptr @g_qCount, align 4
  %i19 = add nsw i32 %i18, -1
  store i32 %i19, ptr @g_qCount, align 4
  br label %bb20

bb20:                                             ; preds = %bb.bb20_crit_edge, %bb5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @qcount() #0 {
bb:
  %i = load i32, ptr @g_qCount, align 4
  ret i32 %i
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dijkstra(i32 noundef %arg, i32 noundef %arg1) #0 {
bb:
  store i32 0, ptr @ch, align 4
  br label %bb2

bb2:                                              ; preds = %bb5, %bb
  %i = load i32, ptr @ch, align 4
  %i3 = load i32, ptr @NUM_NODES, align 4
  %i4 = icmp slt i32 %i, %i3
  br i1 %i4, label %bb5, label %bb19

bb5:                                              ; preds = %bb2
  %i6 = load ptr, ptr @rgnNodes, align 8
  %i7 = load i32, ptr @ch, align 4
  %i8 = sext i32 %i7 to i64
  %i9 = getelementptr inbounds %struct._NODE, ptr %i6, i64 %i8
  %i10 = getelementptr inbounds %struct._NODE, ptr %i9, i32 0, i32 0
  store i32 9999, ptr %i10, align 4
  %i11 = load ptr, ptr @rgnNodes, align 8
  %i12 = load i32, ptr @ch, align 4
  %i13 = sext i32 %i12 to i64
  %i14 = getelementptr inbounds %struct._NODE, ptr %i11, i64 %i13
  %i15 = getelementptr inbounds %struct._NODE, ptr %i14, i32 0, i32 1
  store i32 9999, ptr %i15, align 4
  %i17 = load i32, ptr @ch, align 4
  %i18 = add nsw i32 %i17, 1
  store i32 %i18, ptr @ch, align 4
  br label %bb2, !llvm.loop !10

bb19:                                             ; preds = %bb2
  %i20 = icmp eq i32 %arg, %arg1
  br i1 %i20, label %bb21, label %bb23

bb21:                                             ; preds = %bb19
  %i22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %bb97

bb23:                                             ; preds = %bb19
  %i24 = load ptr, ptr @rgnNodes, align 8
  %i25 = sext i32 %arg to i64
  %i26 = getelementptr inbounds %struct._NODE, ptr %i24, i64 %i25
  %i27 = getelementptr inbounds %struct._NODE, ptr %i26, i32 0, i32 0
  store i32 0, ptr %i27, align 4
  %i28 = load ptr, ptr @rgnNodes, align 8
  %i29 = sext i32 %arg to i64
  %i30 = getelementptr inbounds %struct._NODE, ptr %i28, i64 %i29
  %i31 = getelementptr inbounds %struct._NODE, ptr %i30, i32 0, i32 1
  store i32 9999, ptr %i31, align 4
  call void @enqueue(i32 noundef %arg, i32 noundef 0, i32 noundef 9999)
  br label %bb32

bb32.loopexit:                                    ; preds = %bb36
  br label %bb32, !llvm.loop !11

bb32:                                             ; preds = %bb32.loopexit, %bb23
  %i33 = call i32 @qcount()
  %i34 = icmp sgt i32 %i33, 0
  br i1 %i34, label %bb35, label %bb97.loopexit

bb35:                                             ; preds = %bb32
  call void @dequeue(ptr noundef @iNode, ptr noundef @iDist, ptr noundef @iPrev)
  store i32 0, ptr @i, align 4
  br label %bb36

bb36:                                             ; preds = %bb92, %bb35
  %i37 = load i32, ptr @i, align 4
  %i38 = load i32, ptr @NUM_NODES, align 4
  %i39 = icmp slt i32 %i37, %i38
  br i1 %i39, label %bb40, label %bb32.loopexit

bb40:                                             ; preds = %bb36
  %i41 = load ptr, ptr @AdjMatrix, align 8
  %i42 = load i32, ptr @iNode, align 4
  %i43 = load i32, ptr @NUM_NODES, align 4
  %i44 = mul nsw i32 %i42, %i43
  %i45 = load i32, ptr @i, align 4
  %i46 = add nsw i32 %i44, %i45
  %i47 = sext i32 %i46 to i64
  %i48 = getelementptr inbounds i32, ptr %i41, i64 %i47
  %i49 = load i32, ptr %i48, align 4
  store i32 %i49, ptr @iCost, align 4
  %i50 = icmp ne i32 %i49, 9999
  br i1 %i50, label %bb51, label %bb40.bb92_crit_edge

bb40.bb92_crit_edge:                              ; preds = %bb40
  br label %bb92

bb51:                                             ; preds = %bb40
  %i52 = load ptr, ptr @rgnNodes, align 8
  %i53 = load i32, ptr @i, align 4
  %i54 = sext i32 %i53 to i64
  %i55 = getelementptr inbounds %struct._NODE, ptr %i52, i64 %i54
  %i56 = getelementptr inbounds %struct._NODE, ptr %i55, i32 0, i32 0
  %i57 = load i32, ptr %i56, align 4
  %i58 = icmp eq i32 9999, %i57
  br i1 %i58, label %bb51.bb70_crit_edge, label %bb59

bb51.bb70_crit_edge:                              ; preds = %bb51
  br label %bb70

bb59:                                             ; preds = %bb51
  %i60 = load ptr, ptr @rgnNodes, align 8
  %i61 = load i32, ptr @i, align 4
  %i62 = sext i32 %i61 to i64
  %i63 = getelementptr inbounds %struct._NODE, ptr %i60, i64 %i62
  %i64 = getelementptr inbounds %struct._NODE, ptr %i63, i32 0, i32 0
  %i65 = load i32, ptr %i64, align 4
  %i66 = load i32, ptr @iCost, align 4
  %i67 = load i32, ptr @iDist, align 4
  %i68 = add nsw i32 %i66, %i67
  %i69 = icmp sgt i32 %i65, %i68
  br i1 %i69, label %bb59.bb70_crit_edge, label %bb59.bb92_crit_edge

bb59.bb92_crit_edge:                              ; preds = %bb59
  br label %bb92

bb59.bb70_crit_edge:                              ; preds = %bb59
  br label %bb70

bb70:                                             ; preds = %bb59.bb70_crit_edge, %bb51.bb70_crit_edge
  %i71 = load i32, ptr @iDist, align 4
  %i72 = load i32, ptr @iCost, align 4
  %i73 = add nsw i32 %i71, %i72
  %i74 = load ptr, ptr @rgnNodes, align 8
  %i75 = load i32, ptr @i, align 4
  %i76 = sext i32 %i75 to i64
  %i77 = getelementptr inbounds %struct._NODE, ptr %i74, i64 %i76
  %i78 = getelementptr inbounds %struct._NODE, ptr %i77, i32 0, i32 0
  store i32 %i73, ptr %i78, align 4
  %i79 = load i32, ptr @iNode, align 4
  %i80 = load ptr, ptr @rgnNodes, align 8
  %i81 = load i32, ptr @i, align 4
  %i82 = sext i32 %i81 to i64
  %i83 = getelementptr inbounds %struct._NODE, ptr %i80, i64 %i82
  %i84 = getelementptr inbounds %struct._NODE, ptr %i83, i32 0, i32 1
  store i32 %i79, ptr %i84, align 4
  %i85 = load i32, ptr @i, align 4
  %i86 = load i32, ptr @iDist, align 4
  %i87 = load i32, ptr @iCost, align 4
  %i88 = add nsw i32 %i86, %i87
  %i89 = load i32, ptr @iNode, align 4
  call void @enqueue(i32 noundef %i85, i32 noundef %i88, i32 noundef %i89)
  br label %bb92

bb92:                                             ; preds = %bb59.bb92_crit_edge, %bb40.bb92_crit_edge, %bb70
  %i93 = load i32, ptr @i, align 4
  %i94 = add nsw i32 %i93, 1
  store i32 %i94, ptr @i, align 4
  br label %bb36, !llvm.loop !12

bb97.loopexit:                                    ; preds = %bb32
  br label %bb97

bb97:                                             ; preds = %bb97.loopexit, %bb21
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg4) #0 {
bb:
  %i = alloca i32, align 4
  %i5 = alloca i64, align 8
  %i6 = icmp slt i32 %arg, 2
  br i1 %i6, label %bb7, label %bb12

bb7:                                              ; preds = %bb
  %i8 = load ptr, ptr @stderr, align 8
  %i9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i8, ptr noundef @.str.3)
  %i10 = load ptr, ptr @stderr, align 8
  %i11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i10, ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #6
  unreachable

bb12:                                             ; preds = %bb
  %i13 = call noalias ptr @fopen(ptr noundef @.str.5, ptr noundef @.str.6)
  %i14 = icmp eq ptr %i13, null
  br i1 %i14, label %bb15, label %bb18

bb15:                                             ; preds = %bb12
  %i16 = load ptr, ptr @stderr, align 8
  %i17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i16, ptr noundef @.str.7)
  call void @exit(i32 noundef 1) #6
  unreachable

bb18:                                             ; preds = %bb12
  %i19 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i13, ptr noundef @.str.8, ptr noundef %i5)
  %i20 = call i32 @fclose(ptr noundef %i13)
  %i21 = getelementptr inbounds ptr, ptr %arg4, i64 1
  %i22 = load ptr, ptr %i21, align 8
  %i23 = call noalias ptr @fopen(ptr noundef %i22, ptr noundef @.str.9)
  %i24 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i23, ptr noundef @.str.10, ptr noundef @NUM_NODES)
  %i25 = load i32, ptr @NUM_NODES, align 4
  %i26 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %i25)
  %i27 = load i32, ptr @NUM_NODES, align 4
  %i28 = add nsw i32 %i27, 1
  %i29 = mul nsw i32 4, %i28
  %i30 = load i32, ptr @NUM_NODES, align 4
  %i31 = add nsw i32 %i30, 1
  %i32 = mul nsw i32 %i29, %i31
  %i33 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %i32)
  %i34 = load i32, ptr @NUM_NODES, align 4
  %i35 = add nsw i32 %i34, 1
  %i36 = mul nsw i32 8, %i35
  %i37 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %i36)
  %i38 = load i32, ptr @NUM_NODES, align 4
  %i39 = add nsw i32 %i38, 1
  %i40 = sext i32 %i39 to i64
  %i41 = mul i64 4, %i40
  %i42 = load i32, ptr @NUM_NODES, align 4
  %i43 = add nsw i32 %i42, 1
  %i44 = sext i32 %i43 to i64
  %i45 = mul i64 %i41, %i44
  %i46 = call noalias ptr @malloc(i64 noundef %i45) #5
  store ptr %i46, ptr @AdjMatrix, align 8
  %i47 = load i32, ptr @NUM_NODES, align 4
  %i48 = add nsw i32 %i47, 1
  %i49 = sext i32 %i48 to i64
  %i50 = mul i64 8, %i49
  %i51 = call noalias ptr @malloc(i64 noundef %i50) #5
  store ptr %i51, ptr @rgnNodes, align 8
  br label %bb52

bb52:                                             ; preds = %bb71, %bb18
  %.02 = phi i32 [ 0, %bb18 ], [ %i72, %bb71 ]
  %i53 = load i32, ptr @NUM_NODES, align 4
  %i54 = icmp slt i32 %.02, %i53
  br i1 %i54, label %bb56.preheader, label %bb73

bb56.preheader:                                   ; preds = %bb52
  br label %bb56

bb56:                                             ; preds = %bb56.preheader, %bb59
  %.01 = phi i32 [ %i69, %bb59 ], [ 0, %bb56.preheader ]
  %i57 = load i32, ptr @NUM_NODES, align 4
  %i58 = icmp slt i32 %.01, %i57
  br i1 %i58, label %bb59, label %bb71

bb59:                                             ; preds = %bb56
  %i60 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i23, ptr noundef @.str.10, ptr noundef %i)
  %i61 = load i32, ptr %i, align 4
  %i62 = load ptr, ptr @AdjMatrix, align 8
  %i63 = load i32, ptr @NUM_NODES, align 4
  %i64 = mul nsw i32 %.02, %i63
  %i65 = add nsw i32 %i64, %.01
  %i66 = sext i32 %i65 to i64
  %i67 = getelementptr inbounds i32, ptr %i62, i64 %i66
  store i32 %i61, ptr %i67, align 4
  %i69 = add nsw i32 %.01, 1
  br label %bb56, !llvm.loop !13

bb71:                                             ; preds = %bb56
  %i72 = add nsw i32 %.02, 1
  br label %bb52, !llvm.loop !14

bb73:                                             ; preds = %bb52
  %i74 = load i32, ptr @NUM_NODES, align 4
  %i75 = sdiv i32 %i74, 2
  br label %bb76

bb76:                                             ; preds = %bb88, %bb73
  %.13 = phi i32 [ 0, %bb73 ], [ %i99, %bb88 ]
  %.1 = phi i32 [ %i75, %bb73 ], [ %i100, %bb88 ]
  %i77 = load i32, ptr @NUM_NODES, align 4
  %i78 = icmp slt i32 %.13, %i77
  br i1 %i78, label %bb79, label %bb101

bb79:                                             ; preds = %bb76
  %i80 = load i32, ptr @NUM_NODES, align 4
  %i81 = srem i32 %.1, %i80
  br label %bb82

bb82:                                             ; preds = %bb85, %bb79
  %.0 = phi i64 [ 0, %bb79 ], [ %i87, %bb85 ]
  %i83 = load i64, ptr %i5, align 8
  %i84 = icmp slt i64 %.0, %i83
  br i1 %i84, label %bb85, label %bb88

bb85:                                             ; preds = %bb82
  call void @dijkstra(i32 noundef %.13, i32 noundef %i81)
  %i87 = add nsw i64 %.0, 1
  br label %bb82, !llvm.loop !15

bb88:                                             ; preds = %bb82
  %i89 = load ptr, ptr @rgnNodes, align 8
  %i90 = sext i32 %i81 to i64
  %i91 = getelementptr inbounds %struct._NODE, ptr %i89, i64 %i90
  %i92 = getelementptr inbounds %struct._NODE, ptr %i91, i32 0, i32 0
  %i93 = load i32, ptr %i92, align 4
  %i94 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %i93)
  %i95 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %i96 = load ptr, ptr @rgnNodes, align 8
  call void @print_path(ptr noundef %i96, i32 noundef %i81)
  %i97 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %i99 = add nsw i32 %.13, 1
  %i100 = add nsw i32 %i81, 1
  br label %bb76, !llvm.loop !16

bb101:                                            ; preds = %bb76
  %i102 = load ptr, ptr @AdjMatrix, align 8
  call void @free(ptr noundef %i102) #7
  %i103 = load ptr, ptr @rgnNodes, align 8
  call void @free(ptr noundef %i103) #7
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
