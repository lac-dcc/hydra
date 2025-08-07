; ModuleID = 'automotive_qsort1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.my3DVertexStruct = type { i32, i32, i32, double }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.4 = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1.5 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3.7 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4.8 = private unnamed_addr constant [18 x i8] c"sorted_output.dat\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"wt\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\0AError: Can't open output file\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #8
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i5) #9
  br label %bb21

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #8
  %i9 = call i32 @fclose(ptr noundef nonnull %i2)
  %i10 = load i64, ptr %i, align 8, !tbaa !12
  %i11 = icmp sgt i64 %i10, 0
  br i1 %i11, label %bb12.preheader, label %bb7.bb21_crit_edge

bb7.bb21_crit_edge:                               ; preds = %bb7
  br label %bb21

bb12.preheader:                                   ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb12.preheader
  %i13 = phi i64 [ %i19, %bb12.bb12_crit_edge ], [ %i10, %bb12.preheader ]
  %i14 = phi i64 [ %i15, %bb12.bb12_crit_edge ], [ 0, %bb12.preheader ]
  %i15 = add nuw nsw i64 %i14, 1
  %i16 = icmp eq i64 %i15, %i13
  %i17 = zext i1 %i16 to i32
  %i18 = call i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %i17) #8
  %i19 = load i64, ptr %i, align 8, !tbaa !12
  %i20 = icmp slt i64 %i15, %i19
  br i1 %i20, label %bb12.bb12_crit_edge, label %bb21.loopexit, !llvm.loop !14

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb21.loopexit:                                    ; preds = %bb12
  br label %bb21

bb21:                                             ; preds = %bb21.loopexit, %bb7.bb21_crit_edge, %bb4
  %i22 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb21_crit_edge ], [ 0, %bb21.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #8
  ret i32 %i22
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #3

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local i32 @compare(ptr nocapture noundef readonly %arg, ptr nocapture noundef readonly %arg1) #5 {
bb:
  %i = getelementptr inbounds %struct.my3DVertexStruct, ptr %arg, i64 0, i32 3
  %i2 = load double, ptr %i, align 8, !tbaa !16
  %i3 = getelementptr inbounds %struct.my3DVertexStruct, ptr %arg1, i64 0, i32 3
  %i4 = load double, ptr %i3, align 8, !tbaa !16
  %i5 = fcmp ogt double %i2, %i4
  %i6 = fcmp une double %i2, %i4
  %i7 = sext i1 %i6 to i32
  %i8 = select i1 %i5, i32 1, i32 %i7
  ret i32 %i8
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #0 {
bb:
  %i = alloca [60000 x %struct.my3DVertexStruct], align 16
  %i3 = alloca i32, align 4
  %i4 = alloca i32, align 4
  %i5 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 1440000, ptr nonnull %i) #8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i3) #8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i4) #8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i5) #8
  %i6 = icmp slt i32 %arg, 2
  br i1 %i6, label %bb7, label %bb10

bb7:                                              ; preds = %bb
  %i8 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i9 = tail call i64 @fwrite(ptr nonnull @.str.4, i64 26, i64 1, ptr %i8) #9
  tail call void @exit(i32 noundef 1) #10
  unreachable

bb10:                                             ; preds = %bb
  %i11 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i12 = load ptr, ptr %i11, align 8, !tbaa !8
  %i13 = tail call noalias ptr @fopen(ptr noundef %i12, ptr noundef nonnull @.str.1.5)
  br label %bb14

bb14:                                             ; preds = %bb26, %bb10
  %i15 = phi i64 [ %i43, %bb26 ], [ 0, %bb10 ]
  %i16 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i13, ptr noundef nonnull @.str.2.6, ptr noundef nonnull %i3) #8
  %i17 = icmp eq i32 %i16, 1
  br i1 %i17, label %bb18, label %bb14.bb44_crit_edge

bb14.bb44_crit_edge:                              ; preds = %bb14
  br label %bb44

bb18:                                             ; preds = %bb14
  %i19 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i13, ptr noundef nonnull @.str.2.6, ptr noundef nonnull %i4) #8
  %i20 = icmp eq i32 %i19, 1
  br i1 %i20, label %bb21, label %bb18.bb44split_crit_edge

bb18.bb44split_crit_edge:                         ; preds = %bb18
  br label %bb44split

bb21:                                             ; preds = %bb18
  %i22 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i13, ptr noundef nonnull @.str.2.6, ptr noundef nonnull %i5) #8
  %i23 = icmp eq i32 %i22, 1
  %i24 = icmp ult i64 %i15, 60000
  %i25 = select i1 %i23, i1 %i24, i1 false
  br i1 %i25, label %bb26, label %bb44splitsplit

bb26:                                             ; preds = %bb21
  %i27 = load i32, ptr %i3, align 4, !tbaa !20
  %i28 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15
  store i32 %i27, ptr %i28, align 8, !tbaa !21
  %i29 = load i32, ptr %i4, align 4, !tbaa !20
  %i30 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15, i32 1
  store i32 %i29, ptr %i30, align 4, !tbaa !22
  %i31 = load i32, ptr %i5, align 4, !tbaa !20
  %i32 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15, i32 2
  store i32 %i31, ptr %i32, align 8, !tbaa !23
  %i33 = sitofp i32 %i27 to double
  %i34 = fmul double %i33, %i33
  %i35 = sitofp i32 %i29 to double
  %i36 = fmul double %i35, %i35
  %i37 = fadd double %i34, %i36
  %i38 = sitofp i32 %i31 to double
  %i39 = fmul double %i38, %i38
  %i40 = fadd double %i37, %i39
  %i41 = call double @llvm.sqrt.f64(double %i40)
  %i42 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15, i32 3
  store double %i41, ptr %i42, align 8, !tbaa !16
  %i43 = add nuw nsw i64 %i15, 1
  br label %bb14, !llvm.loop !24

bb44splitsplit:                                   ; preds = %bb21
  br label %bb44split

bb44split:                                        ; preds = %bb44splitsplit, %bb18.bb44split_crit_edge
  br label %bb44

bb44:                                             ; preds = %bb44split, %bb14.bb44_crit_edge
  %i45 = trunc i64 %i15 to i32
  %i46 = call i32 @fclose(ptr noundef %i13)
  %i47 = icmp eq i32 %arg2, 0
  br i1 %i47, label %bb73, label %bb48

bb48:                                             ; preds = %bb44
  %i49 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3.7, i32 noundef %i45)
  call void @qsortx(ptr noundef nonnull %i, i32 noundef %i45, i32 noundef 24, ptr noundef nonnull @compare) #8
  %i50 = call noalias ptr @fopen(ptr noundef nonnull @.str.4.8, ptr noundef nonnull @.str.5)
  %i51 = icmp eq ptr %i50, null
  br i1 %i51, label %bb57, label %bb52

bb52:                                             ; preds = %bb48
  %i53 = icmp eq i32 %i45, 0
  br i1 %i53, label %bb52.bb71_crit_edge, label %bb54

bb52.bb71_crit_edge:                              ; preds = %bb52
  br label %bb71

bb54:                                             ; preds = %bb52
  %i55 = udiv i64 %i15, 100
  %i56 = and i64 %i15, 4294967295
  br label %bb60

bb57:                                             ; preds = %bb48
  %i58 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i59 = call i64 @fwrite(ptr nonnull @.str.6, i64 31, i64 1, ptr %i58) #9
  call void @exit(i32 noundef 1) #10
  unreachable

bb60:                                             ; preds = %bb60.bb60_crit_edge, %bb54
  %i61 = phi i64 [ 0, %bb54 ], [ %i69, %bb60.bb60_crit_edge ]
  %i62 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i61
  %i63 = load i32, ptr %i62, align 8, !tbaa !21
  %i64 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i61, i32 1
  %i65 = load i32, ptr %i64, align 4, !tbaa !22
  %i66 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i61, i32 2
  %i67 = load i32, ptr %i66, align 8, !tbaa !23
  %i68 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef nonnull %i50, ptr noundef nonnull @.str.7, i32 noundef %i63, i32 noundef %i65, i32 noundef %i67)
  %i69 = add i64 %i61, %i55
  %i70 = icmp ult i64 %i69, %i56
  br i1 %i70, label %bb60.bb60_crit_edge, label %bb71.loopexit, !llvm.loop !25

bb60.bb60_crit_edge:                              ; preds = %bb60
  br label %bb60

bb71.loopexit:                                    ; preds = %bb60
  br label %bb71

bb71:                                             ; preds = %bb71.loopexit, %bb52.bb71_crit_edge
  %i72 = call i32 @fclose(ptr noundef nonnull %i50)
  br label %bb74

bb73:                                             ; preds = %bb44
  call void @qsortx(ptr noundef nonnull %i, i32 noundef %i45, i32 noundef 24, ptr noundef nonnull @compare) #8
  br label %bb74

bb74:                                             ; preds = %bb73, %bb71
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i5) #8
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i4) #8
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i3) #8
  call void @llvm.lifetime.end.p0(i64 1440000, ptr nonnull %i) #8
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #7

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @qsortx(ptr noundef %arg, i32 noundef %arg1, i32 noundef %arg2, ptr nocapture noundef readonly %arg3) local_unnamed_addr #0 {
bb:
  %i = alloca [30 x ptr], align 16
  %i4 = alloca [30 x ptr], align 16
  call void @llvm.lifetime.start.p0(i64 240, ptr nonnull %i) #8
  call void @llvm.lifetime.start.p0(i64 240, ptr nonnull %i4) #8
  %i5 = icmp ult i32 %arg1, 2
  %i6 = icmp eq i32 %arg2, 0
  %i7 = or i1 %i5, %i6
  br i1 %i7, label %bb.bb298_crit_edge, label %bb8

bb.bb298_crit_edge:                               ; preds = %bb
  br label %bb298

bb8:                                              ; preds = %bb
  %i9 = add i32 %arg1, -1
  %i10 = mul i32 %i9, %arg2
  %i11 = zext i32 %i10 to i64
  %i12 = getelementptr inbounds i8, ptr %arg, i64 %i11
  %i13 = zext i32 %arg2 to i64
  %i14 = sub nsw i64 0, %i13
  %i15 = add i32 %arg2, -1
  %i16 = and i32 %arg2, 3
  %i17 = icmp eq i32 %i16, 0
  %i18 = icmp ult i32 %i15, 3
  %i19 = and i32 %arg2, 3
  %i20 = icmp eq i32 %i19, 0
  %i21 = icmp ult i32 %i15, 3
  %i22 = and i32 %arg2, 3
  %i23 = icmp eq i32 %i22, 0
  %i24 = icmp ult i32 %i15, 3
  %i25 = and i32 %arg2, 3
  %i26 = icmp eq i32 %i25, 0
  %i27 = icmp ult i32 %i15, 3
  br label %bb28

bb28:                                             ; preds = %bb294, %bb8
  %i29 = phi ptr [ %i12, %bb8 ], [ %i295, %bb294 ]
  %i30 = phi ptr [ %arg, %bb8 ], [ %i296, %bb294 ]
  %i31 = phi i32 [ 0, %bb8 ], [ %i297, %bb294 ]
  %i32 = ptrtoint ptr %i29 to i64
  %i33 = getelementptr inbounds i8, ptr %i29, i64 %i13
  br label %bb34

bb34:                                             ; preds = %bb268.bb34_crit_edge, %bb28
  %i35 = phi ptr [ %i154, %bb268.bb34_crit_edge ], [ %i30, %bb28 ]
  %i36 = phi i32 [ %i269, %bb268.bb34_crit_edge ], [ %i31, %bb28 ]
  %i37 = ptrtoint ptr %i35 to i64
  %i38 = sub i64 %i32, %i37
  %i39 = sdiv i64 %i38, %i13
  %i40 = trunc i64 %i39 to i32
  %i41 = add i32 %i40, 1
  %i42 = icmp ult i32 %i41, 9
  br i1 %i42, label %bb43, label %bb103

bb43:                                             ; preds = %bb34
  %i44 = icmp ugt ptr %i29, %i35
  br i1 %i44, label %bb45, label %bb43.bb284_crit_edge

bb43.bb284_crit_edge:                             ; preds = %bb43
  br label %bb284

bb45:                                             ; preds = %bb43
  %i46 = getelementptr inbounds i8, ptr %i35, i64 %i13
  br label %bb47

bb47:                                             ; preds = %bb100.bb47_crit_edge, %bb45
  %i48 = phi ptr [ %i101, %bb100.bb47_crit_edge ], [ %i29, %bb45 ]
  %i49 = icmp ugt ptr %i46, %i48
  br i1 %i49, label %bb47.bb58_crit_edge, label %bb50.preheader

bb47.bb58_crit_edge:                              ; preds = %bb47
  br label %bb58

bb50.preheader:                                   ; preds = %bb47
  br label %bb50

bb50:                                             ; preds = %bb50.bb50_crit_edge, %bb50.preheader
  %i51 = phi ptr [ %i56, %bb50.bb50_crit_edge ], [ %i46, %bb50.preheader ]
  %i52 = phi ptr [ %i55, %bb50.bb50_crit_edge ], [ %i35, %bb50.preheader ]
  %i53 = tail call i32 %arg3(ptr noundef %i51, ptr noundef %i52) #8
  %i54 = icmp sgt i32 %i53, 0
  %i55 = select i1 %i54, ptr %i51, ptr %i52
  %i56 = getelementptr inbounds i8, ptr %i51, i64 %i13
  %i57 = icmp ugt ptr %i56, %i48
  br i1 %i57, label %bb58.loopexit, label %bb50.bb50_crit_edge, !llvm.loop !26

bb50.bb50_crit_edge:                              ; preds = %bb50
  br label %bb50

bb58.loopexit:                                    ; preds = %bb50
  br label %bb58

bb58:                                             ; preds = %bb58.loopexit, %bb47.bb58_crit_edge
  %i59 = phi ptr [ %i35, %bb47.bb58_crit_edge ], [ %i55, %bb58.loopexit ]
  %i60 = icmp eq ptr %i59, %i48
  br i1 %i60, label %bb58.bb100_crit_edge, label %bb61

bb58.bb100_crit_edge:                             ; preds = %bb58
  br label %bb100

bb61:                                             ; preds = %bb58
  br i1 %i26, label %bb61.bb74_crit_edge, label %bb62.preheader

bb61.bb74_crit_edge:                              ; preds = %bb61
  br label %bb74

bb62.preheader:                                   ; preds = %bb61
  br label %bb62

bb62:                                             ; preds = %bb62.bb62_crit_edge, %bb62.preheader
  %i63 = phi ptr [ %i70, %bb62.bb62_crit_edge ], [ %i59, %bb62.preheader ]
  %i64 = phi i32 [ %i67, %bb62.bb62_crit_edge ], [ %arg2, %bb62.preheader ]
  %i65 = phi ptr [ %i71, %bb62.bb62_crit_edge ], [ %i48, %bb62.preheader ]
  %i66 = phi i32 [ %i72, %bb62.bb62_crit_edge ], [ 0, %bb62.preheader ]
  %i67 = add i32 %i64, -1
  %i68 = load i8, ptr %i63, align 1, !tbaa !27
  %i69 = load i8, ptr %i65, align 1, !tbaa !27
  %i70 = getelementptr inbounds i8, ptr %i63, i64 1
  store i8 %i69, ptr %i63, align 1, !tbaa !27
  %i71 = getelementptr inbounds i8, ptr %i65, i64 1
  store i8 %i68, ptr %i65, align 1, !tbaa !27
  %i72 = add i32 %i66, 1
  %i73 = icmp eq i32 %i72, %i25
  br i1 %i73, label %bb74.loopexit, label %bb62.bb62_crit_edge, !llvm.loop !28

bb62.bb62_crit_edge:                              ; preds = %bb62
  br label %bb62

bb74.loopexit:                                    ; preds = %bb62
  br label %bb74

bb74:                                             ; preds = %bb74.loopexit, %bb61.bb74_crit_edge
  %i75 = phi ptr [ %i59, %bb61.bb74_crit_edge ], [ %i70, %bb74.loopexit ]
  %i76 = phi i32 [ %arg2, %bb61.bb74_crit_edge ], [ %i67, %bb74.loopexit ]
  %i77 = phi ptr [ %i48, %bb61.bb74_crit_edge ], [ %i71, %bb74.loopexit ]
  br i1 %i27, label %bb74.bb100_crit_edge, label %bb78.preheader

bb74.bb100_crit_edge:                             ; preds = %bb74
  br label %bb100

bb78.preheader:                                   ; preds = %bb74
  br label %bb78

bb78:                                             ; preds = %bb78.bb78_crit_edge, %bb78.preheader
  %i79 = phi ptr [ %i97, %bb78.bb78_crit_edge ], [ %i75, %bb78.preheader ]
  %i80 = phi i32 [ %i94, %bb78.bb78_crit_edge ], [ %i76, %bb78.preheader ]
  %i81 = phi ptr [ %i98, %bb78.bb78_crit_edge ], [ %i77, %bb78.preheader ]
  %i82 = load i8, ptr %i79, align 1, !tbaa !27
  %i83 = load i8, ptr %i81, align 1, !tbaa !27
  %i84 = getelementptr inbounds i8, ptr %i79, i64 1
  store i8 %i83, ptr %i79, align 1, !tbaa !27
  %i85 = getelementptr inbounds i8, ptr %i81, i64 1
  store i8 %i82, ptr %i81, align 1, !tbaa !27
  %i86 = load i8, ptr %i84, align 1, !tbaa !27
  %i87 = load i8, ptr %i85, align 1, !tbaa !27
  %i88 = getelementptr inbounds i8, ptr %i79, i64 2
  store i8 %i87, ptr %i84, align 1, !tbaa !27
  %i89 = getelementptr inbounds i8, ptr %i81, i64 2
  store i8 %i86, ptr %i85, align 1, !tbaa !27
  %i90 = load i8, ptr %i88, align 1, !tbaa !27
  %i91 = load i8, ptr %i89, align 1, !tbaa !27
  %i92 = getelementptr inbounds i8, ptr %i79, i64 3
  store i8 %i91, ptr %i88, align 1, !tbaa !27
  %i93 = getelementptr inbounds i8, ptr %i81, i64 3
  store i8 %i90, ptr %i89, align 1, !tbaa !27
  %i94 = add i32 %i80, -4
  %i95 = load i8, ptr %i92, align 1, !tbaa !27
  %i96 = load i8, ptr %i93, align 1, !tbaa !27
  %i97 = getelementptr inbounds i8, ptr %i79, i64 4
  store i8 %i96, ptr %i92, align 1, !tbaa !27
  %i98 = getelementptr inbounds i8, ptr %i81, i64 4
  store i8 %i95, ptr %i93, align 1, !tbaa !27
  %i99 = icmp eq i32 %i94, 0
  br i1 %i99, label %bb100.loopexit, label %bb78.bb78_crit_edge, !llvm.loop !30

bb78.bb78_crit_edge:                              ; preds = %bb78
  br label %bb78

bb100.loopexit:                                   ; preds = %bb78
  br label %bb100

bb100:                                            ; preds = %bb100.loopexit, %bb74.bb100_crit_edge, %bb58.bb100_crit_edge
  %i101 = getelementptr inbounds i8, ptr %i48, i64 %i14
  %i102 = icmp ugt ptr %i101, %i35
  br i1 %i102, label %bb100.bb47_crit_edge, label %bb284.loopexit, !llvm.loop !31

bb100.bb47_crit_edge:                             ; preds = %bb100
  br label %bb47

bb103:                                            ; preds = %bb34
  %i104 = lshr i32 %i41, 1
  %i105 = mul i32 %i104, %arg2
  %i106 = icmp eq i32 %i105, 0
  br i1 %i106, label %bb103.bb148_crit_edge, label %bb107

bb103.bb148_crit_edge:                            ; preds = %bb103
  br label %bb148

bb107:                                            ; preds = %bb103
  %i108 = zext i32 %i105 to i64
  %i109 = getelementptr i8, ptr %i35, i64 %i108
  br i1 %i17, label %bb107.bb122_crit_edge, label %bb110.preheader

bb107.bb122_crit_edge:                            ; preds = %bb107
  br label %bb122

bb110.preheader:                                  ; preds = %bb107
  br label %bb110

bb110:                                            ; preds = %bb110.bb110_crit_edge, %bb110.preheader
  %i111 = phi ptr [ %i118, %bb110.bb110_crit_edge ], [ %i109, %bb110.preheader ]
  %i112 = phi i32 [ %i115, %bb110.bb110_crit_edge ], [ %arg2, %bb110.preheader ]
  %i113 = phi ptr [ %i119, %bb110.bb110_crit_edge ], [ %i35, %bb110.preheader ]
  %i114 = phi i32 [ %i120, %bb110.bb110_crit_edge ], [ 0, %bb110.preheader ]
  %i115 = add i32 %i112, -1
  %i116 = load i8, ptr %i111, align 1, !tbaa !27
  %i117 = load i8, ptr %i113, align 1, !tbaa !27
  %i118 = getelementptr inbounds i8, ptr %i111, i64 1
  store i8 %i117, ptr %i111, align 1, !tbaa !27
  %i119 = getelementptr inbounds i8, ptr %i113, i64 1
  store i8 %i116, ptr %i113, align 1, !tbaa !27
  %i120 = add i32 %i114, 1
  %i121 = icmp eq i32 %i120, %i16
  br i1 %i121, label %bb122.loopexit, label %bb110.bb110_crit_edge, !llvm.loop !32

bb110.bb110_crit_edge:                            ; preds = %bb110
  br label %bb110

bb122.loopexit:                                   ; preds = %bb110
  br label %bb122

bb122:                                            ; preds = %bb122.loopexit, %bb107.bb122_crit_edge
  %i123 = phi ptr [ %i109, %bb107.bb122_crit_edge ], [ %i118, %bb122.loopexit ]
  %i124 = phi i32 [ %arg2, %bb107.bb122_crit_edge ], [ %i115, %bb122.loopexit ]
  %i125 = phi ptr [ %i35, %bb107.bb122_crit_edge ], [ %i119, %bb122.loopexit ]
  br i1 %i18, label %bb122.bb148_crit_edge, label %bb126.preheader

bb122.bb148_crit_edge:                            ; preds = %bb122
  br label %bb148

bb126.preheader:                                  ; preds = %bb122
  br label %bb126

bb126:                                            ; preds = %bb126.bb126_crit_edge, %bb126.preheader
  %i127 = phi ptr [ %i145, %bb126.bb126_crit_edge ], [ %i123, %bb126.preheader ]
  %i128 = phi i32 [ %i142, %bb126.bb126_crit_edge ], [ %i124, %bb126.preheader ]
  %i129 = phi ptr [ %i146, %bb126.bb126_crit_edge ], [ %i125, %bb126.preheader ]
  %i130 = load i8, ptr %i127, align 1, !tbaa !27
  %i131 = load i8, ptr %i129, align 1, !tbaa !27
  %i132 = getelementptr inbounds i8, ptr %i127, i64 1
  store i8 %i131, ptr %i127, align 1, !tbaa !27
  %i133 = getelementptr inbounds i8, ptr %i129, i64 1
  store i8 %i130, ptr %i129, align 1, !tbaa !27
  %i134 = load i8, ptr %i132, align 1, !tbaa !27
  %i135 = load i8, ptr %i133, align 1, !tbaa !27
  %i136 = getelementptr inbounds i8, ptr %i127, i64 2
  store i8 %i135, ptr %i132, align 1, !tbaa !27
  %i137 = getelementptr inbounds i8, ptr %i129, i64 2
  store i8 %i134, ptr %i133, align 1, !tbaa !27
  %i138 = load i8, ptr %i136, align 1, !tbaa !27
  %i139 = load i8, ptr %i137, align 1, !tbaa !27
  %i140 = getelementptr inbounds i8, ptr %i127, i64 3
  store i8 %i139, ptr %i136, align 1, !tbaa !27
  %i141 = getelementptr inbounds i8, ptr %i129, i64 3
  store i8 %i138, ptr %i137, align 1, !tbaa !27
  %i142 = add i32 %i128, -4
  %i143 = load i8, ptr %i140, align 1, !tbaa !27
  %i144 = load i8, ptr %i141, align 1, !tbaa !27
  %i145 = getelementptr inbounds i8, ptr %i127, i64 4
  store i8 %i144, ptr %i140, align 1, !tbaa !27
  %i146 = getelementptr inbounds i8, ptr %i129, i64 4
  store i8 %i143, ptr %i141, align 1, !tbaa !27
  %i147 = icmp eq i32 %i142, 0
  br i1 %i147, label %bb148.loopexit, label %bb126.bb126_crit_edge, !llvm.loop !30

bb126.bb126_crit_edge:                            ; preds = %bb126
  br label %bb126

bb148.loopexit:                                   ; preds = %bb126
  br label %bb148

bb148:                                            ; preds = %bb148.loopexit, %bb122.bb148_crit_edge, %bb103.bb148_crit_edge
  br label %bb149

bb149:                                            ; preds = %bb171, %bb148
  %i150 = phi ptr [ %i35, %bb148 ], [ %i154, %bb171 ]
  %i151 = phi ptr [ %i33, %bb148 ], [ %i162, %bb171 ]
  br label %bb152

bb152:                                            ; preds = %bb156.bb152_crit_edge, %bb149
  %i153 = phi ptr [ %i150, %bb149 ], [ %i154, %bb156.bb152_crit_edge ]
  %i154 = getelementptr inbounds i8, ptr %i153, i64 %i13
  %i155 = icmp ugt ptr %i154, %i29
  br i1 %i155, label %bb152.bb159_crit_edge, label %bb156

bb152.bb159_crit_edge:                            ; preds = %bb152
  br label %bb159

bb156:                                            ; preds = %bb152
  %i157 = tail call i32 %arg3(ptr noundef nonnull %i154, ptr noundef %i35) #8
  %i158 = icmp slt i32 %i157, 1
  br i1 %i158, label %bb156.bb152_crit_edge, label %bb159split, !llvm.loop !33

bb156.bb152_crit_edge:                            ; preds = %bb156
  br label %bb152

bb159split:                                       ; preds = %bb156
  br label %bb159

bb159:                                            ; preds = %bb159split, %bb152.bb159_crit_edge
  br label %bb160

bb160:                                            ; preds = %bb164.bb160_crit_edge, %bb159
  %i161 = phi ptr [ %i162, %bb164.bb160_crit_edge ], [ %i151, %bb159 ]
  %i162 = getelementptr inbounds i8, ptr %i161, i64 %i14
  %i163 = icmp ugt ptr %i162, %i35
  br i1 %i163, label %bb164, label %bb160.bb167_crit_edge

bb160.bb167_crit_edge:                            ; preds = %bb160
  br label %bb167

bb164:                                            ; preds = %bb160
  %i165 = tail call i32 %arg3(ptr noundef nonnull %i162, ptr noundef %i35) #8
  %i166 = icmp sgt i32 %i165, -1
  br i1 %i166, label %bb164.bb160_crit_edge, label %bb167split, !llvm.loop !34

bb164.bb160_crit_edge:                            ; preds = %bb164
  br label %bb160

bb167split:                                       ; preds = %bb164
  br label %bb167

bb167:                                            ; preds = %bb167split, %bb160.bb167_crit_edge
  %i168 = icmp ult ptr %i162, %i154
  br i1 %i168, label %bb211, label %bb169

bb169:                                            ; preds = %bb167
  %i170 = icmp eq ptr %i154, %i162
  br i1 %i170, label %bb169.bb171_crit_edge, label %bb172

bb169.bb171_crit_edge:                            ; preds = %bb169
  br label %bb171

bb171.loopexit:                                   ; preds = %bb189
  br label %bb171

bb171:                                            ; preds = %bb185.bb171_crit_edge, %bb171.loopexit, %bb169.bb171_crit_edge
  br label %bb149

bb172:                                            ; preds = %bb169
  br i1 %i20, label %bb172.bb185_crit_edge, label %bb173.preheader

bb172.bb185_crit_edge:                            ; preds = %bb172
  br label %bb185

bb173.preheader:                                  ; preds = %bb172
  br label %bb173

bb173:                                            ; preds = %bb173.bb173_crit_edge, %bb173.preheader
  %i174 = phi ptr [ %i181, %bb173.bb173_crit_edge ], [ %i154, %bb173.preheader ]
  %i175 = phi i32 [ %i178, %bb173.bb173_crit_edge ], [ %arg2, %bb173.preheader ]
  %i176 = phi ptr [ %i182, %bb173.bb173_crit_edge ], [ %i162, %bb173.preheader ]
  %i177 = phi i32 [ %i183, %bb173.bb173_crit_edge ], [ 0, %bb173.preheader ]
  %i178 = add i32 %i175, -1
  %i179 = load i8, ptr %i174, align 1, !tbaa !27
  %i180 = load i8, ptr %i176, align 1, !tbaa !27
  %i181 = getelementptr inbounds i8, ptr %i174, i64 1
  store i8 %i180, ptr %i174, align 1, !tbaa !27
  %i182 = getelementptr inbounds i8, ptr %i176, i64 1
  store i8 %i179, ptr %i176, align 1, !tbaa !27
  %i183 = add i32 %i177, 1
  %i184 = icmp eq i32 %i183, %i19
  br i1 %i184, label %bb185.loopexit, label %bb173.bb173_crit_edge, !llvm.loop !35

bb173.bb173_crit_edge:                            ; preds = %bb173
  br label %bb173

bb185.loopexit:                                   ; preds = %bb173
  br label %bb185

bb185:                                            ; preds = %bb185.loopexit, %bb172.bb185_crit_edge
  %i186 = phi ptr [ %i154, %bb172.bb185_crit_edge ], [ %i181, %bb185.loopexit ]
  %i187 = phi i32 [ %arg2, %bb172.bb185_crit_edge ], [ %i178, %bb185.loopexit ]
  %i188 = phi ptr [ %i162, %bb172.bb185_crit_edge ], [ %i182, %bb185.loopexit ]
  br i1 %i21, label %bb185.bb171_crit_edge, label %bb189.preheader

bb185.bb171_crit_edge:                            ; preds = %bb185
  br label %bb171

bb189.preheader:                                  ; preds = %bb185
  br label %bb189

bb189:                                            ; preds = %bb189.bb189_crit_edge, %bb189.preheader
  %i190 = phi ptr [ %i208, %bb189.bb189_crit_edge ], [ %i186, %bb189.preheader ]
  %i191 = phi i32 [ %i205, %bb189.bb189_crit_edge ], [ %i187, %bb189.preheader ]
  %i192 = phi ptr [ %i209, %bb189.bb189_crit_edge ], [ %i188, %bb189.preheader ]
  %i193 = load i8, ptr %i190, align 1, !tbaa !27
  %i194 = load i8, ptr %i192, align 1, !tbaa !27
  %i195 = getelementptr inbounds i8, ptr %i190, i64 1
  store i8 %i194, ptr %i190, align 1, !tbaa !27
  %i196 = getelementptr inbounds i8, ptr %i192, i64 1
  store i8 %i193, ptr %i192, align 1, !tbaa !27
  %i197 = load i8, ptr %i195, align 1, !tbaa !27
  %i198 = load i8, ptr %i196, align 1, !tbaa !27
  %i199 = getelementptr inbounds i8, ptr %i190, i64 2
  store i8 %i198, ptr %i195, align 1, !tbaa !27
  %i200 = getelementptr inbounds i8, ptr %i192, i64 2
  store i8 %i197, ptr %i196, align 1, !tbaa !27
  %i201 = load i8, ptr %i199, align 1, !tbaa !27
  %i202 = load i8, ptr %i200, align 1, !tbaa !27
  %i203 = getelementptr inbounds i8, ptr %i190, i64 3
  store i8 %i202, ptr %i199, align 1, !tbaa !27
  %i204 = getelementptr inbounds i8, ptr %i192, i64 3
  store i8 %i201, ptr %i200, align 1, !tbaa !27
  %i205 = add i32 %i191, -4
  %i206 = load i8, ptr %i203, align 1, !tbaa !27
  %i207 = load i8, ptr %i204, align 1, !tbaa !27
  %i208 = getelementptr inbounds i8, ptr %i190, i64 4
  store i8 %i207, ptr %i203, align 1, !tbaa !27
  %i209 = getelementptr inbounds i8, ptr %i192, i64 4
  store i8 %i206, ptr %i204, align 1, !tbaa !27
  %i210 = icmp eq i32 %i205, 0
  br i1 %i210, label %bb171.loopexit, label %bb189.bb189_crit_edge, !llvm.loop !30

bb189.bb189_crit_edge:                            ; preds = %bb189
  br label %bb189

bb211:                                            ; preds = %bb167
  %i212 = icmp eq ptr %i35, %i162
  br i1 %i212, label %bb211.bb252_crit_edge, label %bb213

bb211.bb252_crit_edge:                            ; preds = %bb211
  br label %bb252

bb213:                                            ; preds = %bb211
  br i1 %i23, label %bb213.bb226_crit_edge, label %bb214.preheader

bb213.bb226_crit_edge:                            ; preds = %bb213
  br label %bb226

bb214.preheader:                                  ; preds = %bb213
  br label %bb214

bb214:                                            ; preds = %bb214.bb214_crit_edge, %bb214.preheader
  %i215 = phi ptr [ %i222, %bb214.bb214_crit_edge ], [ %i35, %bb214.preheader ]
  %i216 = phi i32 [ %i219, %bb214.bb214_crit_edge ], [ %arg2, %bb214.preheader ]
  %i217 = phi ptr [ %i223, %bb214.bb214_crit_edge ], [ %i162, %bb214.preheader ]
  %i218 = phi i32 [ %i224, %bb214.bb214_crit_edge ], [ 0, %bb214.preheader ]
  %i219 = add i32 %i216, -1
  %i220 = load i8, ptr %i215, align 1, !tbaa !27
  %i221 = load i8, ptr %i217, align 1, !tbaa !27
  %i222 = getelementptr inbounds i8, ptr %i215, i64 1
  store i8 %i221, ptr %i215, align 1, !tbaa !27
  %i223 = getelementptr inbounds i8, ptr %i217, i64 1
  store i8 %i220, ptr %i217, align 1, !tbaa !27
  %i224 = add i32 %i218, 1
  %i225 = icmp eq i32 %i224, %i22
  br i1 %i225, label %bb226.loopexit, label %bb214.bb214_crit_edge, !llvm.loop !36

bb214.bb214_crit_edge:                            ; preds = %bb214
  br label %bb214

bb226.loopexit:                                   ; preds = %bb214
  br label %bb226

bb226:                                            ; preds = %bb226.loopexit, %bb213.bb226_crit_edge
  %i227 = phi ptr [ %i35, %bb213.bb226_crit_edge ], [ %i222, %bb226.loopexit ]
  %i228 = phi i32 [ %arg2, %bb213.bb226_crit_edge ], [ %i219, %bb226.loopexit ]
  %i229 = phi ptr [ %i162, %bb213.bb226_crit_edge ], [ %i223, %bb226.loopexit ]
  br i1 %i24, label %bb226.bb252_crit_edge, label %bb230.preheader

bb226.bb252_crit_edge:                            ; preds = %bb226
  br label %bb252

bb230.preheader:                                  ; preds = %bb226
  br label %bb230

bb230:                                            ; preds = %bb230.bb230_crit_edge, %bb230.preheader
  %i231 = phi ptr [ %i249, %bb230.bb230_crit_edge ], [ %i227, %bb230.preheader ]
  %i232 = phi i32 [ %i246, %bb230.bb230_crit_edge ], [ %i228, %bb230.preheader ]
  %i233 = phi ptr [ %i250, %bb230.bb230_crit_edge ], [ %i229, %bb230.preheader ]
  %i234 = load i8, ptr %i231, align 1, !tbaa !27
  %i235 = load i8, ptr %i233, align 1, !tbaa !27
  %i236 = getelementptr inbounds i8, ptr %i231, i64 1
  store i8 %i235, ptr %i231, align 1, !tbaa !27
  %i237 = getelementptr inbounds i8, ptr %i233, i64 1
  store i8 %i234, ptr %i233, align 1, !tbaa !27
  %i238 = load i8, ptr %i236, align 1, !tbaa !27
  %i239 = load i8, ptr %i237, align 1, !tbaa !27
  %i240 = getelementptr inbounds i8, ptr %i231, i64 2
  store i8 %i239, ptr %i236, align 1, !tbaa !27
  %i241 = getelementptr inbounds i8, ptr %i233, i64 2
  store i8 %i238, ptr %i237, align 1, !tbaa !27
  %i242 = load i8, ptr %i240, align 1, !tbaa !27
  %i243 = load i8, ptr %i241, align 1, !tbaa !27
  %i244 = getelementptr inbounds i8, ptr %i231, i64 3
  store i8 %i243, ptr %i240, align 1, !tbaa !27
  %i245 = getelementptr inbounds i8, ptr %i233, i64 3
  store i8 %i242, ptr %i241, align 1, !tbaa !27
  %i246 = add i32 %i232, -4
  %i247 = load i8, ptr %i244, align 1, !tbaa !27
  %i248 = load i8, ptr %i245, align 1, !tbaa !27
  %i249 = getelementptr inbounds i8, ptr %i231, i64 4
  store i8 %i248, ptr %i244, align 1, !tbaa !27
  %i250 = getelementptr inbounds i8, ptr %i233, i64 4
  store i8 %i247, ptr %i245, align 1, !tbaa !27
  %i251 = icmp eq i32 %i246, 0
  br i1 %i251, label %bb252.loopexit, label %bb230.bb230_crit_edge, !llvm.loop !30

bb230.bb230_crit_edge:                            ; preds = %bb230
  br label %bb230

bb252.loopexit:                                   ; preds = %bb230
  br label %bb252

bb252:                                            ; preds = %bb252.loopexit, %bb226.bb252_crit_edge, %bb211.bb252_crit_edge
  %i253 = getelementptr inbounds i8, ptr %i162, i64 -1
  %i254 = ptrtoint ptr %i253 to i64
  %i255 = sub i64 %i254, %i37
  %i256 = ptrtoint ptr %i154 to i64
  %i257 = sub i64 %i32, %i256
  %i258 = icmp slt i64 %i255, %i257
  br i1 %i258, label %bb271, label %bb259

bb259:                                            ; preds = %bb252
  %i260 = getelementptr inbounds i8, ptr %i35, i64 %i13
  %i261 = icmp ult ptr %i260, %i162
  br i1 %i261, label %bb262, label %bb259.bb268_crit_edge

bb259.bb268_crit_edge:                            ; preds = %bb259
  br label %bb268

bb262:                                            ; preds = %bb259
  %i263 = sext i32 %i36 to i64
  %i264 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i263
  store ptr %i35, ptr %i264, align 8, !tbaa !8
  %i265 = getelementptr inbounds i8, ptr %i162, i64 %i14
  %i266 = getelementptr inbounds [30 x ptr], ptr %i4, i64 0, i64 %i263
  store ptr %i265, ptr %i266, align 8, !tbaa !8
  %i267 = add nsw i32 %i36, 1
  br label %bb268

bb268:                                            ; preds = %bb262, %bb259.bb268_crit_edge
  %i269 = phi i32 [ %i267, %bb262 ], [ %i36, %bb259.bb268_crit_edge ]
  %i270 = icmp ult ptr %i154, %i29
  br i1 %i270, label %bb268.bb34_crit_edge, label %bb284.loopexit1

bb268.bb34_crit_edge:                             ; preds = %bb268
  br label %bb34

bb271:                                            ; preds = %bb252
  %i272 = icmp ult ptr %i154, %i29
  br i1 %i272, label %bb273, label %bb271.bb278_crit_edge

bb271.bb278_crit_edge:                            ; preds = %bb271
  br label %bb278

bb273:                                            ; preds = %bb271
  %i274 = sext i32 %i36 to i64
  %i275 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i274
  store ptr %i154, ptr %i275, align 8, !tbaa !8
  %i276 = getelementptr inbounds [30 x ptr], ptr %i4, i64 0, i64 %i274
  store ptr %i29, ptr %i276, align 8, !tbaa !8
  %i277 = add nsw i32 %i36, 1
  br label %bb278

bb278:                                            ; preds = %bb273, %bb271.bb278_crit_edge
  %i279 = phi i32 [ %i277, %bb273 ], [ %i36, %bb271.bb278_crit_edge ]
  %i280 = getelementptr inbounds i8, ptr %i35, i64 %i13
  %i281 = icmp ult ptr %i280, %i162
  br i1 %i281, label %bb282, label %bb278.bb284_crit_edge

bb278.bb284_crit_edge:                            ; preds = %bb278
  br label %bb284

bb282:                                            ; preds = %bb278
  %i283 = getelementptr inbounds i8, ptr %i162, i64 %i14
  br label %bb294

bb284.loopexit:                                   ; preds = %bb100
  br label %bb284

bb284.loopexit1:                                  ; preds = %bb268
  br label %bb284

bb284:                                            ; preds = %bb284.loopexit1, %bb284.loopexit, %bb278.bb284_crit_edge, %bb43.bb284_crit_edge
  %i285 = phi i32 [ %i279, %bb278.bb284_crit_edge ], [ %i36, %bb43.bb284_crit_edge ], [ %i36, %bb284.loopexit ], [ %i269, %bb284.loopexit1 ]
  %i286 = icmp sgt i32 %i285, 0
  br i1 %i286, label %bb287, label %bb298.loopexit

bb287:                                            ; preds = %bb284
  %i288 = add nsw i32 %i285, -1
  %i289 = zext nneg i32 %i288 to i64
  %i290 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i289
  %i291 = load ptr, ptr %i290, align 8, !tbaa !8
  %i292 = getelementptr inbounds [30 x ptr], ptr %i4, i64 0, i64 %i289
  %i293 = load ptr, ptr %i292, align 8, !tbaa !8
  br label %bb294

bb294:                                            ; preds = %bb287, %bb282
  %i295 = phi ptr [ %i283, %bb282 ], [ %i293, %bb287 ]
  %i296 = phi ptr [ %i35, %bb282 ], [ %i291, %bb287 ]
  %i297 = phi i32 [ %i279, %bb282 ], [ %i288, %bb287 ]
  br label %bb28

bb298.loopexit:                                   ; preds = %bb284
  br label %bb298

bb298:                                            ; preds = %bb298.loopexit, %bb.bb298_crit_edge
  call void @llvm.lifetime.end.p0(i64 240, ptr nonnull %i4) #8
  call void @llvm.lifetime.end.p0(i64 240, ptr nonnull %i) #8
  ret void
}

attributes #0 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!17, !19, i64 16}
!17 = !{!"my3DVertexStruct", !18, i64 0, !18, i64 4, !18, i64 8, !19, i64 16}
!18 = !{!"int", !10, i64 0}
!19 = !{!"double", !10, i64 0}
!20 = !{!18, !18, i64 0}
!21 = !{!17, !18, i64 0}
!22 = !{!17, !18, i64 4}
!23 = !{!17, !18, i64 8}
!24 = distinct !{!24, !15}
!25 = distinct !{!25, !15}
!26 = distinct !{!26, !15}
!27 = !{!10, !10, i64 0}
!28 = distinct !{!28, !29}
!29 = !{!"llvm.loop.unroll.disable"}
!30 = distinct !{!30, !15}
!31 = distinct !{!31, !15}
!32 = distinct !{!32, !29}
!33 = distinct !{!33, !15}
!34 = distinct !{!34, !15}
!35 = distinct !{!35, !29}
!36 = distinct !{!36, !29}
