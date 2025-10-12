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
  %i2 = load double, ptr %i, align 8, !tbaa !17
  %i3 = getelementptr inbounds %struct.my3DVertexStruct, ptr %arg1, i64 0, i32 3
  %i4 = load double, ptr %i3, align 8, !tbaa !17
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
  %i27 = load i32, ptr %i3, align 4, !tbaa !21
  %i28 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15
  store i32 %i27, ptr %i28, align 8, !tbaa !22
  %i29 = load i32, ptr %i4, align 4, !tbaa !21
  %i30 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15, i32 1
  store i32 %i29, ptr %i30, align 4, !tbaa !23
  %i31 = load i32, ptr %i5, align 4, !tbaa !21
  %i32 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15, i32 2
  store i32 %i31, ptr %i32, align 8, !tbaa !24
  %i33 = sitofp i32 %i27 to double
  %i34 = fmul double %i33, %i33
  %i35 = sitofp i32 %i29 to double
  %i36 = fmul double %i35, %i35
  %i37 = fadd double %i34, %i36
  %i38 = sitofp i32 %i31 to double
  %i39 = fmul double %i38, %i38
  %i40 = fadd double %i37, %i39
  %i41 = call double @sqrt(double noundef %i40) #8
  %i42 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i15, i32 3
  store double %i41, ptr %i42, align 8, !tbaa !17
  %i43 = add nuw nsw i64 %i15, 1
  br label %bb14, !llvm.loop !25

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
  %i63 = load i32, ptr %i62, align 8, !tbaa !22
  %i64 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i61, i32 1
  %i65 = load i32, ptr %i64, align 4, !tbaa !23
  %i66 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i61, i32 2
  %i67 = load i32, ptr %i66, align 8, !tbaa !24
  %i68 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef nonnull %i50, ptr noundef nonnull @.str.7, i32 noundef %i63, i32 noundef %i65, i32 noundef %i67)
  %i69 = add i64 %i61, %i55
  %i70 = icmp ult i64 %i69, %i56
  br i1 %i70, label %bb60.bb60_crit_edge, label %bb71.loopexit, !llvm.loop !26

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

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @sqrt(double noundef) local_unnamed_addr #7

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
  br i1 %i7, label %bb.bb171_crit_edge, label %bb8

bb.bb171_crit_edge:                               ; preds = %bb
  br label %bb171

bb8:                                              ; preds = %bb
  %i9 = add i32 %arg1, -1
  %i10 = mul i32 %i9, %arg2
  %i11 = zext i32 %i10 to i64
  %i12 = getelementptr inbounds i8, ptr %arg, i64 %i11
  %i13 = zext i32 %arg2 to i64
  %i14 = sub nsw i64 0, %i13
  %i15 = sub nsw i64 0, %i13
  br label %bb16

bb16:                                             ; preds = %bb167, %bb8
  %i17 = phi ptr [ %i12, %bb8 ], [ %i168, %bb167 ]
  %i18 = phi ptr [ %arg, %bb8 ], [ %i169, %bb167 ]
  %i19 = phi i32 [ 0, %bb8 ], [ %i170, %bb167 ]
  %i20 = ptrtoint ptr %i17 to i64
  %i21 = getelementptr inbounds i8, ptr %i17, i64 %i13
  br label %bb22

bb22:                                             ; preds = %bb141.bb22_crit_edge, %bb16
  %i23 = phi ptr [ %i85, %bb141.bb22_crit_edge ], [ %i18, %bb16 ]
  %i24 = phi i32 [ %i142, %bb141.bb22_crit_edge ], [ %i19, %bb16 ]
  %i25 = ptrtoint ptr %i23 to i64
  %i26 = sub i64 %i20, %i25
  %i27 = sdiv i64 %i26, %i13
  %i28 = trunc i64 %i27 to i32
  %i29 = add i32 %i28, 1
  %i30 = icmp ult i32 %i29, 9
  br i1 %i30, label %bb31, label %bb62

bb31:                                             ; preds = %bb22
  %i32 = icmp ugt ptr %i17, %i23
  br i1 %i32, label %bb33, label %bb31.bb157_crit_edge

bb31.bb157_crit_edge:                             ; preds = %bb31
  br label %bb157

bb33:                                             ; preds = %bb31
  %i34 = getelementptr inbounds i8, ptr %i23, i64 %i13
  br label %bb35

bb35:                                             ; preds = %bb59.bb35_crit_edge, %bb33
  %i36 = phi ptr [ %i17, %bb33 ], [ %i60, %bb59.bb35_crit_edge ]
  %i37 = icmp ugt ptr %i34, %i36
  br i1 %i37, label %bb35.bb46_crit_edge, label %bb38.preheader

bb35.bb46_crit_edge:                              ; preds = %bb35
  br label %bb46

bb38.preheader:                                   ; preds = %bb35
  br label %bb38

bb38:                                             ; preds = %bb38.bb38_crit_edge, %bb38.preheader
  %i39 = phi ptr [ %i44, %bb38.bb38_crit_edge ], [ %i34, %bb38.preheader ]
  %i40 = phi ptr [ %i43, %bb38.bb38_crit_edge ], [ %i23, %bb38.preheader ]
  %i41 = tail call i32 %arg3(ptr noundef %i39, ptr noundef %i40) #8
  %i42 = icmp sgt i32 %i41, 0
  %i43 = select i1 %i42, ptr %i39, ptr %i40
  %i44 = getelementptr inbounds i8, ptr %i39, i64 %i13
  %i45 = icmp ugt ptr %i44, %i36
  br i1 %i45, label %bb46.loopexit, label %bb38.bb38_crit_edge, !llvm.loop !27

bb38.bb38_crit_edge:                              ; preds = %bb38
  br label %bb38

bb46.loopexit:                                    ; preds = %bb38
  br label %bb46

bb46:                                             ; preds = %bb46.loopexit, %bb35.bb46_crit_edge
  %i47 = phi ptr [ %i23, %bb35.bb46_crit_edge ], [ %i43, %bb46.loopexit ]
  %i48 = icmp eq ptr %i47, %i36
  br i1 %i48, label %bb46.bb59_crit_edge, label %bb49.preheader

bb46.bb59_crit_edge:                              ; preds = %bb46
  br label %bb59

bb49.preheader:                                   ; preds = %bb46
  br label %bb49

bb49:                                             ; preds = %bb49.bb49_crit_edge, %bb49.preheader
  %i50 = phi ptr [ %i56, %bb49.bb49_crit_edge ], [ %i47, %bb49.preheader ]
  %i51 = phi i32 [ %i53, %bb49.bb49_crit_edge ], [ %arg2, %bb49.preheader ]
  %i52 = phi ptr [ %i57, %bb49.bb49_crit_edge ], [ %i36, %bb49.preheader ]
  %i53 = add i32 %i51, -1
  %i54 = load i8, ptr %i50, align 1, !tbaa !28
  %i55 = load i8, ptr %i52, align 1, !tbaa !28
  %i56 = getelementptr inbounds i8, ptr %i50, i64 1
  store i8 %i55, ptr %i50, align 1, !tbaa !28
  %i57 = getelementptr inbounds i8, ptr %i52, i64 1
  store i8 %i54, ptr %i52, align 1, !tbaa !28
  %i58 = icmp eq i32 %i53, 0
  br i1 %i58, label %bb59.loopexit, label %bb49.bb49_crit_edge, !llvm.loop !29

bb49.bb49_crit_edge:                              ; preds = %bb49
  br label %bb49

bb59.loopexit:                                    ; preds = %bb49
  br label %bb59

bb59:                                             ; preds = %bb59.loopexit, %bb46.bb59_crit_edge
  %i60 = getelementptr inbounds i8, ptr %i36, i64 %i15
  %i61 = icmp ugt ptr %i60, %i23
  br i1 %i61, label %bb59.bb35_crit_edge, label %bb157.loopexit, !llvm.loop !30

bb59.bb35_crit_edge:                              ; preds = %bb59
  br label %bb35

bb62:                                             ; preds = %bb22
  %i63 = lshr i32 %i29, 1
  %i64 = mul i32 %i63, %arg2
  %i65 = icmp eq i32 %i64, 0
  br i1 %i65, label %bb62.bb79_crit_edge, label %bb66

bb62.bb79_crit_edge:                              ; preds = %bb62
  br label %bb79

bb66:                                             ; preds = %bb62
  %i67 = zext i32 %i64 to i64
  %i68 = getelementptr i8, ptr %i23, i64 %i67
  br label %bb69

bb69:                                             ; preds = %bb69.bb69_crit_edge, %bb66
  %i70 = phi ptr [ %i76, %bb69.bb69_crit_edge ], [ %i68, %bb66 ]
  %i71 = phi i32 [ %i73, %bb69.bb69_crit_edge ], [ %arg2, %bb66 ]
  %i72 = phi ptr [ %i77, %bb69.bb69_crit_edge ], [ %i23, %bb66 ]
  %i73 = add i32 %i71, -1
  %i74 = load i8, ptr %i70, align 1, !tbaa !28
  %i75 = load i8, ptr %i72, align 1, !tbaa !28
  %i76 = getelementptr inbounds i8, ptr %i70, i64 1
  store i8 %i75, ptr %i70, align 1, !tbaa !28
  %i77 = getelementptr inbounds i8, ptr %i72, i64 1
  store i8 %i74, ptr %i72, align 1, !tbaa !28
  %i78 = icmp eq i32 %i73, 0
  br i1 %i78, label %bb79.loopexit, label %bb69.bb69_crit_edge, !llvm.loop !29

bb69.bb69_crit_edge:                              ; preds = %bb69
  br label %bb69

bb79.loopexit:                                    ; preds = %bb69
  br label %bb79

bb79:                                             ; preds = %bb79.loopexit, %bb62.bb79_crit_edge
  br label %bb80

bb80:                                             ; preds = %bb112, %bb79
  %i81 = phi ptr [ %i85, %bb112 ], [ %i23, %bb79 ]
  %i82 = phi ptr [ %i93, %bb112 ], [ %i21, %bb79 ]
  br label %bb83

bb83:                                             ; preds = %bb87.bb83_crit_edge, %bb80
  %i84 = phi ptr [ %i81, %bb80 ], [ %i85, %bb87.bb83_crit_edge ]
  %i85 = getelementptr inbounds i8, ptr %i84, i64 %i13
  %i86 = icmp ugt ptr %i85, %i17
  br i1 %i86, label %bb83.bb90_crit_edge, label %bb87

bb83.bb90_crit_edge:                              ; preds = %bb83
  br label %bb90

bb87:                                             ; preds = %bb83
  %i88 = tail call i32 %arg3(ptr noundef nonnull %i85, ptr noundef %i23) #8
  %i89 = icmp slt i32 %i88, 1
  br i1 %i89, label %bb87.bb83_crit_edge, label %bb90split, !llvm.loop !31

bb87.bb83_crit_edge:                              ; preds = %bb87
  br label %bb83

bb90split:                                        ; preds = %bb87
  br label %bb90

bb90:                                             ; preds = %bb90split, %bb83.bb90_crit_edge
  br label %bb91

bb91:                                             ; preds = %bb95.bb91_crit_edge, %bb90
  %i92 = phi ptr [ %i93, %bb95.bb91_crit_edge ], [ %i82, %bb90 ]
  %i93 = getelementptr inbounds i8, ptr %i92, i64 %i14
  %i94 = icmp ugt ptr %i93, %i23
  br i1 %i94, label %bb95, label %bb91.bb98_crit_edge

bb91.bb98_crit_edge:                              ; preds = %bb91
  br label %bb98

bb95:                                             ; preds = %bb91
  %i96 = tail call i32 %arg3(ptr noundef nonnull %i93, ptr noundef %i23) #8
  %i97 = icmp sgt i32 %i96, -1
  br i1 %i97, label %bb95.bb91_crit_edge, label %bb98split, !llvm.loop !32

bb95.bb91_crit_edge:                              ; preds = %bb95
  br label %bb91

bb98split:                                        ; preds = %bb95
  br label %bb98

bb98:                                             ; preds = %bb98split, %bb91.bb98_crit_edge
  %i99 = icmp ult ptr %i93, %i85
  br i1 %i99, label %bb113, label %bb100

bb100:                                            ; preds = %bb98
  %i101 = icmp eq ptr %i85, %i93
  br i1 %i101, label %bb100.bb112_crit_edge, label %bb102.preheader

bb100.bb112_crit_edge:                            ; preds = %bb100
  br label %bb112

bb102.preheader:                                  ; preds = %bb100
  br label %bb102

bb102:                                            ; preds = %bb102.bb102_crit_edge, %bb102.preheader
  %i103 = phi ptr [ %i109, %bb102.bb102_crit_edge ], [ %i85, %bb102.preheader ]
  %i104 = phi i32 [ %i106, %bb102.bb102_crit_edge ], [ %arg2, %bb102.preheader ]
  %i105 = phi ptr [ %i110, %bb102.bb102_crit_edge ], [ %i93, %bb102.preheader ]
  %i106 = add i32 %i104, -1
  %i107 = load i8, ptr %i103, align 1, !tbaa !28
  %i108 = load i8, ptr %i105, align 1, !tbaa !28
  %i109 = getelementptr inbounds i8, ptr %i103, i64 1
  store i8 %i108, ptr %i103, align 1, !tbaa !28
  %i110 = getelementptr inbounds i8, ptr %i105, i64 1
  store i8 %i107, ptr %i105, align 1, !tbaa !28
  %i111 = icmp eq i32 %i106, 0
  br i1 %i111, label %bb112.loopexit, label %bb102.bb102_crit_edge, !llvm.loop !29

bb102.bb102_crit_edge:                            ; preds = %bb102
  br label %bb102

bb112.loopexit:                                   ; preds = %bb102
  br label %bb112

bb112:                                            ; preds = %bb112.loopexit, %bb100.bb112_crit_edge
  br label %bb80, !llvm.loop !33

bb113:                                            ; preds = %bb98
  %i114 = icmp eq ptr %i23, %i93
  br i1 %i114, label %bb113.bb125_crit_edge, label %bb115.preheader

bb113.bb125_crit_edge:                            ; preds = %bb113
  br label %bb125

bb115.preheader:                                  ; preds = %bb113
  br label %bb115

bb115:                                            ; preds = %bb115.bb115_crit_edge, %bb115.preheader
  %i116 = phi ptr [ %i122, %bb115.bb115_crit_edge ], [ %i23, %bb115.preheader ]
  %i117 = phi i32 [ %i119, %bb115.bb115_crit_edge ], [ %arg2, %bb115.preheader ]
  %i118 = phi ptr [ %i123, %bb115.bb115_crit_edge ], [ %i93, %bb115.preheader ]
  %i119 = add i32 %i117, -1
  %i120 = load i8, ptr %i116, align 1, !tbaa !28
  %i121 = load i8, ptr %i118, align 1, !tbaa !28
  %i122 = getelementptr inbounds i8, ptr %i116, i64 1
  store i8 %i121, ptr %i116, align 1, !tbaa !28
  %i123 = getelementptr inbounds i8, ptr %i118, i64 1
  store i8 %i120, ptr %i118, align 1, !tbaa !28
  %i124 = icmp eq i32 %i119, 0
  br i1 %i124, label %bb125.loopexit, label %bb115.bb115_crit_edge, !llvm.loop !29

bb115.bb115_crit_edge:                            ; preds = %bb115
  br label %bb115

bb125.loopexit:                                   ; preds = %bb115
  br label %bb125

bb125:                                            ; preds = %bb125.loopexit, %bb113.bb125_crit_edge
  %i126 = getelementptr inbounds i8, ptr %i93, i64 -1
  %i127 = ptrtoint ptr %i126 to i64
  %i128 = sub i64 %i127, %i25
  %i129 = ptrtoint ptr %i85 to i64
  %i130 = sub i64 %i20, %i129
  %i131 = icmp slt i64 %i128, %i130
  br i1 %i131, label %bb144, label %bb132

bb132:                                            ; preds = %bb125
  %i133 = getelementptr inbounds i8, ptr %i23, i64 %i13
  %i134 = icmp ult ptr %i133, %i93
  br i1 %i134, label %bb135, label %bb132.bb141_crit_edge

bb132.bb141_crit_edge:                            ; preds = %bb132
  br label %bb141

bb135:                                            ; preds = %bb132
  %i136 = sext i32 %i24 to i64
  %i137 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i136
  store ptr %i23, ptr %i137, align 8, !tbaa !8
  %i138 = getelementptr inbounds i8, ptr %i93, i64 %i14
  %i139 = getelementptr inbounds [30 x ptr], ptr %i4, i64 0, i64 %i136
  store ptr %i138, ptr %i139, align 8, !tbaa !8
  %i140 = add nsw i32 %i24, 1
  br label %bb141

bb141:                                            ; preds = %bb135, %bb132.bb141_crit_edge
  %i142 = phi i32 [ %i140, %bb135 ], [ %i24, %bb132.bb141_crit_edge ]
  %i143 = icmp ult ptr %i85, %i17
  br i1 %i143, label %bb141.bb22_crit_edge, label %bb157.loopexit1

bb141.bb22_crit_edge:                             ; preds = %bb141
  br label %bb22

bb144:                                            ; preds = %bb125
  %i145 = icmp ult ptr %i85, %i17
  br i1 %i145, label %bb146, label %bb144.bb151_crit_edge

bb144.bb151_crit_edge:                            ; preds = %bb144
  br label %bb151

bb146:                                            ; preds = %bb144
  %i147 = sext i32 %i24 to i64
  %i148 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i147
  store ptr %i85, ptr %i148, align 8, !tbaa !8
  %i149 = getelementptr inbounds [30 x ptr], ptr %i4, i64 0, i64 %i147
  store ptr %i17, ptr %i149, align 8, !tbaa !8
  %i150 = add nsw i32 %i24, 1
  br label %bb151

bb151:                                            ; preds = %bb146, %bb144.bb151_crit_edge
  %i152 = phi i32 [ %i150, %bb146 ], [ %i24, %bb144.bb151_crit_edge ]
  %i153 = getelementptr inbounds i8, ptr %i23, i64 %i13
  %i154 = icmp ult ptr %i153, %i93
  br i1 %i154, label %bb155, label %bb151.bb157_crit_edge

bb151.bb157_crit_edge:                            ; preds = %bb151
  br label %bb157

bb155:                                            ; preds = %bb151
  %i156 = getelementptr inbounds i8, ptr %i93, i64 %i14
  br label %bb167

bb157.loopexit:                                   ; preds = %bb59
  br label %bb157

bb157.loopexit1:                                  ; preds = %bb141
  br label %bb157

bb157:                                            ; preds = %bb157.loopexit1, %bb157.loopexit, %bb151.bb157_crit_edge, %bb31.bb157_crit_edge
  %i158 = phi i32 [ %i152, %bb151.bb157_crit_edge ], [ %i24, %bb31.bb157_crit_edge ], [ %i24, %bb157.loopexit ], [ %i142, %bb157.loopexit1 ]
  %i159 = icmp sgt i32 %i158, 0
  br i1 %i159, label %bb160, label %bb171.loopexit

bb160:                                            ; preds = %bb157
  %i161 = add nsw i32 %i158, -1
  %i162 = zext nneg i32 %i161 to i64
  %i163 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i162
  %i164 = load ptr, ptr %i163, align 8, !tbaa !8
  %i165 = getelementptr inbounds [30 x ptr], ptr %i4, i64 0, i64 %i162
  %i166 = load ptr, ptr %i165, align 8, !tbaa !8
  br label %bb167

bb167:                                            ; preds = %bb160, %bb155
  %i168 = phi ptr [ %i156, %bb155 ], [ %i166, %bb160 ]
  %i169 = phi ptr [ %i23, %bb155 ], [ %i164, %bb160 ]
  %i170 = phi i32 [ %i152, %bb155 ], [ %i161, %bb160 ]
  br label %bb16

bb171.loopexit:                                   ; preds = %bb157
  br label %bb171

bb171:                                            ; preds = %bb171.loopexit, %bb.bb171_crit_edge
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
attributes #7 = { mustprogress nofree nounwind willreturn memory(write) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!14 = distinct !{!14, !15, !16}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!18, !20, i64 16}
!18 = !{!"my3DVertexStruct", !19, i64 0, !19, i64 4, !19, i64 8, !20, i64 16}
!19 = !{!"int", !10, i64 0}
!20 = !{!"double", !10, i64 0}
!21 = !{!19, !19, i64 0}
!22 = !{!18, !19, i64 0}
!23 = !{!18, !19, i64 4}
!24 = !{!18, !19, i64 8}
!25 = distinct !{!25, !15, !16}
!26 = distinct !{!26, !15, !16}
!27 = distinct !{!27, !15, !16}
!28 = !{!10, !10, i64 0}
!29 = distinct !{!29, !15, !16}
!30 = distinct !{!30, !15, !16}
!31 = distinct !{!31, !15, !16}
!32 = distinct !{!32, !15, !16}
!33 = distinct !{!33, !16}
