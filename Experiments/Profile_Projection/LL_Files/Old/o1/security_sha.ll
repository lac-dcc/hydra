; ModuleID = 'security_sha.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.SHA_INFO = type { [5 x i64], i64, i64, [16 x i64] }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@stdin = external local_unnamed_addr global ptr, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.1.5 = private unnamed_addr constant [30 x i8] c"error opening %s for reading\0A\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"%08lx %08lx %08lx %08lx %08lx\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #12
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i5) #13
  br label %bb21

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #12
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
  %i18 = call i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %i17) #12
  %i19 = load i64, ptr %i, align 8, !tbaa !12
  %i20 = icmp slt i64 %i15, %i19
  br i1 %i20, label %bb12.bb12_crit_edge, label %bb21.loopexit, !llvm.loop !14

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb21.loopexit:                                    ; preds = %bb12
  br label %bb21

bb21:                                             ; preds = %bb21.loopexit, %bb7.bb21_crit_edge, %bb4
  %i22 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb21_crit_edge ], [ 0, %bb21.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #12
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

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #0 {
bb:
  %i = alloca %struct.SHA_INFO, align 8
  call void @llvm.lifetime.start.p0(i64 184, ptr nonnull %i) #12
  %i3 = icmp slt i32 %arg, 2
  br i1 %i3, label %bb9, label %bb4

bb4:                                              ; preds = %bb
  %i5 = add nsw i32 %arg, -1
  %i6 = icmp eq i32 %i5, 0
  br i1 %i6, label %bb4.bb30_crit_edge, label %bb7

bb4.bb30_crit_edge:                               ; preds = %bb4
  br label %bb30

bb7:                                              ; preds = %bb4
  %i8 = icmp eq i32 %arg2, 0
  br label %bb13

bb9:                                              ; preds = %bb
  %i10 = load ptr, ptr @stdin, align 8, !tbaa !8
  call void @sha_stream(ptr noundef nonnull %i, ptr noundef %i10) #12
  %i11 = icmp eq i32 %arg2, 0
  br i1 %i11, label %bb9.bb30_crit_edge, label %bb12

bb9.bb30_crit_edge:                               ; preds = %bb9
  br label %bb30

bb12:                                             ; preds = %bb9
  call void @sha_print(ptr noundef nonnull %i) #12
  br label %bb30

bb13:                                             ; preds = %bb26.bb13_crit_edge, %bb7
  %i14 = phi i32 [ %i5, %bb7 ], [ %i28, %bb26.bb13_crit_edge ]
  %i15 = phi ptr [ %arg1, %bb7 ], [ %i16, %bb26.bb13_crit_edge ]
  %i16 = getelementptr inbounds ptr, ptr %i15, i64 1
  %i17 = load ptr, ptr %i16, align 8, !tbaa !8
  %i18 = call noalias ptr @fopen(ptr noundef %i17, ptr noundef nonnull @.str.4)
  %i19 = icmp eq ptr %i18, null
  br i1 %i19, label %bb20, label %bb24

bb20:                                             ; preds = %bb13
  %i21 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i22 = load ptr, ptr %i16, align 8, !tbaa !8
  %i23 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i21, ptr noundef nonnull @.str.1.5, ptr noundef %i22) #13
  call void @exit(i32 noundef 1) #14
  unreachable

bb24:                                             ; preds = %bb13
  call void @sha_stream(ptr noundef nonnull %i, ptr noundef nonnull %i18) #12
  br i1 %i8, label %bb24.bb26_crit_edge, label %bb25

bb24.bb26_crit_edge:                              ; preds = %bb24
  br label %bb26

bb25:                                             ; preds = %bb24
  call void @sha_print(ptr noundef nonnull %i) #12
  br label %bb26

bb26:                                             ; preds = %bb25, %bb24.bb26_crit_edge
  %i27 = call i32 @fclose(ptr noundef nonnull %i18)
  %i28 = add nsw i32 %i14, -1
  %i29 = icmp eq i32 %i28, 0
  br i1 %i29, label %bb30.loopexit, label %bb26.bb13_crit_edge, !llvm.loop !17

bb26.bb13_crit_edge:                              ; preds = %bb26
  br label %bb13

bb30.loopexit:                                    ; preds = %bb26
  br label %bb30

bb30:                                             ; preds = %bb30.loopexit, %bb12, %bb9.bb30_crit_edge, %bb4.bb30_crit_edge
  call void @llvm.lifetime.end.p0(i64 184, ptr nonnull %i) #12
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable
define dso_local void @sha_init(ptr nocapture noundef writeonly %arg) local_unnamed_addr #6 {
bb:
  store i64 1732584193, ptr %arg, align 8, !tbaa !12
  %i = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 1
  store i64 4023233417, ptr %i, align 8, !tbaa !12
  %i1 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 2
  store i64 2562383102, ptr %i1, align 8, !tbaa !12
  %i2 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 3
  store i64 271733878, ptr %i2, align 8, !tbaa !12
  %i3 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 4
  store i64 3285377520, ptr %i3, align 8, !tbaa !12
  %i4 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i4, i8 0, i64 16, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @sha_update(ptr nocapture noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #8 {
bb:
  %i = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 1
  %i3 = load i64, ptr %i, align 8, !tbaa !18
  %i4 = sext i32 %arg2 to i64
  %i5 = shl nsw i64 %i4, 3
  %i6 = xor i64 %i3, -1
  %i7 = icmp ugt i64 %i5, %i6
  br i1 %i7, label %bb8, label %bb.bb12_crit_edge

bb.bb12_crit_edge:                                ; preds = %bb
  br label %bb12

bb8:                                              ; preds = %bb
  %i9 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i10 = load i64, ptr %i9, align 8, !tbaa !20
  %i11 = add i64 %i10, 1
  store i64 %i11, ptr %i9, align 8, !tbaa !20
  br label %bb12

bb12:                                             ; preds = %bb8, %bb.bb12_crit_edge
  %i13 = add i64 %i3, %i5
  store i64 %i13, ptr %i, align 8, !tbaa !18
  %i14 = lshr i64 %i4, 29
  %i15 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i16 = load i64, ptr %i15, align 8, !tbaa !20
  %i17 = add i64 %i16, %i14
  store i64 %i17, ptr %i15, align 8, !tbaa !20
  %i18 = icmp sgt i32 %arg2, 63
  br i1 %i18, label %bb19, label %bb12.bb41_crit_edge

bb12.bb41_crit_edge:                              ; preds = %bb12
  br label %bb41

bb19:                                             ; preds = %bb12
  %i20 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  br label %bb21

bb21:                                             ; preds = %bb37.bb21_crit_edge, %bb19
  %i22 = phi i32 [ %arg2, %bb19 ], [ %i39, %bb37.bb21_crit_edge ]
  %i23 = phi ptr [ %arg1, %bb19 ], [ %i38, %bb37.bb21_crit_edge ]
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(64) %i20, ptr noundef nonnull align 1 dereferenceable(64) %i23, i64 64, i1 false)
  br label %bb24

bb24:                                             ; preds = %bb24.bb24_crit_edge, %bb21
  %i25 = phi ptr [ %i20, %bb21 ], [ %i34, %bb24.bb24_crit_edge ]
  %i26 = phi i32 [ 0, %bb21 ], [ %i35, %bb24.bb24_crit_edge ]
  %i27 = load i8, ptr %i25, align 1, !tbaa !21
  %i28 = getelementptr inbounds i8, ptr %i25, i64 1
  %i29 = load i8, ptr %i28, align 1, !tbaa !21
  %i30 = getelementptr inbounds i8, ptr %i25, i64 2
  %i31 = load i8, ptr %i30, align 1, !tbaa !21
  %i32 = getelementptr inbounds i8, ptr %i25, i64 3
  %i33 = load i8, ptr %i32, align 1, !tbaa !21
  store i8 %i33, ptr %i25, align 1, !tbaa !21
  store i8 %i31, ptr %i28, align 1, !tbaa !21
  store i8 %i29, ptr %i30, align 1, !tbaa !21
  store i8 %i27, ptr %i32, align 1, !tbaa !21
  %i34 = getelementptr inbounds i8, ptr %i25, i64 8
  %i35 = add nuw nsw i32 %i26, 1
  %i36 = icmp eq i32 %i35, 8
  br i1 %i36, label %bb37, label %bb24.bb24_crit_edge, !llvm.loop !22

bb24.bb24_crit_edge:                              ; preds = %bb24
  br label %bb24

bb37:                                             ; preds = %bb24
  tail call fastcc void @sha_transform(ptr noundef %arg)
  %i38 = getelementptr inbounds i8, ptr %i23, i64 64
  %i39 = add nsw i32 %i22, -64
  %i40 = icmp sgt i32 %i22, 127
  br i1 %i40, label %bb37.bb21_crit_edge, label %bb41.loopexit, !llvm.loop !23

bb37.bb21_crit_edge:                              ; preds = %bb37
  br label %bb21

bb41.loopexit:                                    ; preds = %bb37
  br label %bb41

bb41:                                             ; preds = %bb41.loopexit, %bb12.bb41_crit_edge
  %i42 = phi ptr [ %arg1, %bb12.bb41_crit_edge ], [ %i38, %bb41.loopexit ]
  %i43 = phi i32 [ %arg2, %bb12.bb41_crit_edge ], [ %i39, %bb41.loopexit ]
  %i44 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  %i45 = sext i32 %i43 to i64
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %i44, ptr align 1 %i42, i64 %i45, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #9

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define internal fastcc void @sha_transform(ptr nocapture noundef %arg) unnamed_addr #10 {
bb:
  %i = alloca [80 x i64], align 16
  call void @llvm.lifetime.start.p0(i64 640, ptr nonnull %i) #12
  %i1 = getelementptr i8, ptr %arg, i64 56
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(128) %i, ptr noundef nonnull align 8 dereferenceable(128) %i1, i64 128, i1 false), !tbaa !12
  br label %bb2

bb2:                                              ; preds = %bb2.bb2_crit_edge, %bb
  %i3 = phi i64 [ 16, %bb ], [ %i20, %bb2.bb2_crit_edge ]
  %i4 = add nsw i64 %i3, -3
  %i5 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i4
  %i6 = load i64, ptr %i5, align 8, !tbaa !12
  %i7 = add nsw i64 %i3, -8
  %i8 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i7
  %i9 = load i64, ptr %i8, align 8, !tbaa !12
  %i10 = xor i64 %i9, %i6
  %i11 = add nsw i64 %i3, -14
  %i12 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i11
  %i13 = load i64, ptr %i12, align 8, !tbaa !12
  %i14 = xor i64 %i10, %i13
  %i15 = add nsw i64 %i3, -16
  %i16 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i15
  %i17 = load i64, ptr %i16, align 8, !tbaa !12
  %i18 = xor i64 %i14, %i17
  %i19 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i3
  store i64 %i18, ptr %i19, align 8, !tbaa !12
  %i20 = add nuw nsw i64 %i3, 1
  %i21 = icmp eq i64 %i20, 80
  br i1 %i21, label %bb22, label %bb2.bb2_crit_edge, !llvm.loop !24

bb2.bb2_crit_edge:                                ; preds = %bb2
  br label %bb2

bb22:                                             ; preds = %bb2
  %i23 = load i64, ptr %arg, align 8, !tbaa !12
  %i24 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 1
  %i25 = load i64, ptr %i24, align 8, !tbaa !12
  %i26 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 2
  %i27 = load i64, ptr %i26, align 8, !tbaa !12
  %i28 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 3
  %i29 = load i64, ptr %i28, align 8, !tbaa !12
  %i30 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 4
  %i31 = load i64, ptr %i30, align 8, !tbaa !12
  br label %bb32

bb32:                                             ; preds = %bb32.bb32_crit_edge, %bb22
  %i33 = phi i64 [ 0, %bb22 ], [ %i55, %bb32.bb32_crit_edge ]
  %i34 = phi i64 [ %i31, %bb22 ], [ %i35, %bb32.bb32_crit_edge ]
  %i35 = phi i64 [ %i29, %bb22 ], [ %i36, %bb32.bb32_crit_edge ]
  %i36 = phi i64 [ %i27, %bb22 ], [ %i54, %bb32.bb32_crit_edge ]
  %i37 = phi i64 [ %i25, %bb22 ], [ %i38, %bb32.bb32_crit_edge ]
  %i38 = phi i64 [ %i23, %bb22 ], [ %i51, %bb32.bb32_crit_edge ]
  %i39 = shl i64 %i38, 5
  %i40 = lshr i64 %i38, 27
  %i41 = or i64 %i39, %i40
  %i42 = and i64 %i36, %i37
  %i43 = xor i64 %i37, -1
  %i44 = and i64 %i35, %i43
  %i45 = or i64 %i44, %i42
  %i46 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i33
  %i47 = load i64, ptr %i46, align 8, !tbaa !12
  %i48 = add i64 %i41, 1518500249
  %i49 = add i64 %i48, %i34
  %i50 = add i64 %i49, %i45
  %i51 = add i64 %i50, %i47
  %i52 = shl i64 %i37, 30
  %i53 = lshr i64 %i37, 2
  %i54 = or i64 %i52, %i53
  %i55 = add nuw nsw i64 %i33, 1
  %i56 = icmp eq i64 %i55, 20
  br i1 %i56, label %bb57.preheader, label %bb32.bb32_crit_edge, !llvm.loop !25

bb32.bb32_crit_edge:                              ; preds = %bb32
  br label %bb32

bb57.preheader:                                   ; preds = %bb32
  br label %bb57

bb57:                                             ; preds = %bb57.bb57_crit_edge, %bb57.preheader
  %i58 = phi i64 [ %i78, %bb57.bb57_crit_edge ], [ 20, %bb57.preheader ]
  %i59 = phi i64 [ %i60, %bb57.bb57_crit_edge ], [ %i35, %bb57.preheader ]
  %i60 = phi i64 [ %i61, %bb57.bb57_crit_edge ], [ %i36, %bb57.preheader ]
  %i61 = phi i64 [ %i77, %bb57.bb57_crit_edge ], [ %i54, %bb57.preheader ]
  %i62 = phi i64 [ %i63, %bb57.bb57_crit_edge ], [ %i38, %bb57.preheader ]
  %i63 = phi i64 [ %i74, %bb57.bb57_crit_edge ], [ %i51, %bb57.preheader ]
  %i64 = shl i64 %i63, 5
  %i65 = lshr i64 %i63, 27
  %i66 = or i64 %i64, %i65
  %i67 = xor i64 %i61, %i62
  %i68 = xor i64 %i67, %i60
  %i69 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i58
  %i70 = load i64, ptr %i69, align 8, !tbaa !12
  %i71 = add i64 %i66, 1859775393
  %i72 = add i64 %i71, %i68
  %i73 = add i64 %i72, %i59
  %i74 = add i64 %i73, %i70
  %i75 = shl i64 %i62, 30
  %i76 = lshr i64 %i62, 2
  %i77 = or i64 %i75, %i76
  %i78 = add nuw nsw i64 %i58, 1
  %i79 = icmp eq i64 %i78, 40
  br i1 %i79, label %bb80.preheader, label %bb57.bb57_crit_edge, !llvm.loop !26

bb57.bb57_crit_edge:                              ; preds = %bb57
  br label %bb57

bb80.preheader:                                   ; preds = %bb57
  br label %bb80

bb80:                                             ; preds = %bb80.bb80_crit_edge, %bb80.preheader
  %i81 = phi i64 [ %i103, %bb80.bb80_crit_edge ], [ 40, %bb80.preheader ]
  %i82 = phi i64 [ %i83, %bb80.bb80_crit_edge ], [ %i60, %bb80.preheader ]
  %i83 = phi i64 [ %i84, %bb80.bb80_crit_edge ], [ %i61, %bb80.preheader ]
  %i84 = phi i64 [ %i102, %bb80.bb80_crit_edge ], [ %i77, %bb80.preheader ]
  %i85 = phi i64 [ %i86, %bb80.bb80_crit_edge ], [ %i63, %bb80.preheader ]
  %i86 = phi i64 [ %i99, %bb80.bb80_crit_edge ], [ %i74, %bb80.preheader ]
  %i87 = shl i64 %i86, 5
  %i88 = lshr i64 %i86, 27
  %i89 = or i64 %i87, %i88
  %i90 = or i64 %i83, %i84
  %i91 = and i64 %i90, %i85
  %i92 = and i64 %i83, %i84
  %i93 = or i64 %i91, %i92
  %i94 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i81
  %i95 = load i64, ptr %i94, align 8, !tbaa !12
  %i96 = add i64 %i89, 2400959708
  %i97 = add i64 %i96, %i82
  %i98 = add i64 %i97, %i93
  %i99 = add i64 %i98, %i95
  %i100 = shl i64 %i85, 30
  %i101 = lshr i64 %i85, 2
  %i102 = or i64 %i100, %i101
  %i103 = add nuw nsw i64 %i81, 1
  %i104 = icmp eq i64 %i103, 60
  br i1 %i104, label %bb105.preheader, label %bb80.bb80_crit_edge, !llvm.loop !27

bb80.bb80_crit_edge:                              ; preds = %bb80
  br label %bb80

bb105.preheader:                                  ; preds = %bb80
  br label %bb105

bb105:                                            ; preds = %bb105.bb105_crit_edge, %bb105.preheader
  %i106 = phi i64 [ %i126, %bb105.bb105_crit_edge ], [ 60, %bb105.preheader ]
  %i107 = phi i64 [ %i108, %bb105.bb105_crit_edge ], [ %i83, %bb105.preheader ]
  %i108 = phi i64 [ %i109, %bb105.bb105_crit_edge ], [ %i84, %bb105.preheader ]
  %i109 = phi i64 [ %i125, %bb105.bb105_crit_edge ], [ %i102, %bb105.preheader ]
  %i110 = phi i64 [ %i111, %bb105.bb105_crit_edge ], [ %i86, %bb105.preheader ]
  %i111 = phi i64 [ %i122, %bb105.bb105_crit_edge ], [ %i99, %bb105.preheader ]
  %i112 = shl i64 %i111, 5
  %i113 = lshr i64 %i111, 27
  %i114 = or i64 %i112, %i113
  %i115 = xor i64 %i109, %i110
  %i116 = xor i64 %i115, %i108
  %i117 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i106
  %i118 = load i64, ptr %i117, align 8, !tbaa !12
  %i119 = add i64 %i114, 3395469782
  %i120 = add i64 %i119, %i116
  %i121 = add i64 %i120, %i107
  %i122 = add i64 %i121, %i118
  %i123 = shl i64 %i110, 30
  %i124 = lshr i64 %i110, 2
  %i125 = or i64 %i123, %i124
  %i126 = add nuw nsw i64 %i106, 1
  %i127 = icmp eq i64 %i126, 80
  br i1 %i127, label %bb128, label %bb105.bb105_crit_edge, !llvm.loop !28

bb105.bb105_crit_edge:                            ; preds = %bb105
  br label %bb105

bb128:                                            ; preds = %bb105
  %i129 = add i64 %i122, %i23
  store i64 %i129, ptr %arg, align 8, !tbaa !12
  %i130 = add i64 %i111, %i25
  store i64 %i130, ptr %i24, align 8, !tbaa !12
  %i131 = add i64 %i125, %i27
  store i64 %i131, ptr %i26, align 8, !tbaa !12
  %i132 = add i64 %i109, %i29
  store i64 %i132, ptr %i28, align 8, !tbaa !12
  %i133 = add i64 %i108, %i31
  store i64 %i133, ptr %i30, align 8, !tbaa !12
  call void @llvm.lifetime.end.p0(i64 640, ptr nonnull %i) #12
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @sha_final(ptr nocapture noundef %arg) local_unnamed_addr #8 {
bb:
  %i = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 1
  %i1 = load i64, ptr %i, align 8, !tbaa !18
  %i2 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i3 = load i64, ptr %i2, align 8, !tbaa !20
  %i4 = trunc i64 %i1 to i32
  %i5 = lshr i32 %i4, 3
  %i6 = and i32 %i5, 63
  %i7 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  %i8 = zext nneg i32 %i6 to i64
  %i9 = getelementptr inbounds i8, ptr %i7, i64 %i8
  store i8 -128, ptr %i9, align 1, !tbaa !21
  %i10 = icmp ugt i32 %i6, 55
  %i11 = zext nneg i32 %i6 to i64
  %i12 = getelementptr i8, ptr %i7, i64 %i11
  %i13 = getelementptr i8, ptr %i12, i64 1
  br i1 %i10, label %bb14, label %bb31

bb14:                                             ; preds = %bb
  %i15 = xor i32 %i6, 63
  %i16 = zext nneg i32 %i15 to i64
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %i13, i8 0, i64 %i16, i1 false)
  br label %bb17

bb17:                                             ; preds = %bb17.bb17_crit_edge, %bb14
  %i18 = phi ptr [ %i7, %bb14 ], [ %i27, %bb17.bb17_crit_edge ]
  %i19 = phi i32 [ 0, %bb14 ], [ %i28, %bb17.bb17_crit_edge ]
  %i20 = load i8, ptr %i18, align 1, !tbaa !21
  %i21 = getelementptr inbounds i8, ptr %i18, i64 1
  %i22 = load i8, ptr %i21, align 1, !tbaa !21
  %i23 = getelementptr inbounds i8, ptr %i18, i64 2
  %i24 = load i8, ptr %i23, align 1, !tbaa !21
  %i25 = getelementptr inbounds i8, ptr %i18, i64 3
  %i26 = load i8, ptr %i25, align 1, !tbaa !21
  store i8 %i26, ptr %i18, align 1, !tbaa !21
  store i8 %i24, ptr %i21, align 1, !tbaa !21
  store i8 %i22, ptr %i23, align 1, !tbaa !21
  store i8 %i20, ptr %i25, align 1, !tbaa !21
  %i27 = getelementptr inbounds i8, ptr %i18, i64 8
  %i28 = add nuw nsw i32 %i19, 1
  %i29 = icmp eq i32 %i28, 8
  br i1 %i29, label %bb30, label %bb17.bb17_crit_edge, !llvm.loop !22

bb17.bb17_crit_edge:                              ; preds = %bb17
  br label %bb17

bb30:                                             ; preds = %bb17
  tail call fastcc void @sha_transform(ptr noundef %arg)
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %i7, i8 0, i64 56, i1 false)
  br label %bb34

bb31:                                             ; preds = %bb
  %i32 = sub nuw nsw i32 55, %i6
  %i33 = zext nneg i32 %i32 to i64
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %i13, i8 0, i64 %i33, i1 false)
  br label %bb34

bb34:                                             ; preds = %bb31, %bb30
  br label %bb35

bb35:                                             ; preds = %bb35.bb35_crit_edge, %bb34
  %i36 = phi ptr [ %i45, %bb35.bb35_crit_edge ], [ %i7, %bb34 ]
  %i37 = phi i32 [ %i46, %bb35.bb35_crit_edge ], [ 0, %bb34 ]
  %i38 = load i8, ptr %i36, align 1, !tbaa !21
  %i39 = getelementptr inbounds i8, ptr %i36, i64 1
  %i40 = load i8, ptr %i39, align 1, !tbaa !21
  %i41 = getelementptr inbounds i8, ptr %i36, i64 2
  %i42 = load i8, ptr %i41, align 1, !tbaa !21
  %i43 = getelementptr inbounds i8, ptr %i36, i64 3
  %i44 = load i8, ptr %i43, align 1, !tbaa !21
  store i8 %i44, ptr %i36, align 1, !tbaa !21
  store i8 %i42, ptr %i39, align 1, !tbaa !21
  store i8 %i40, ptr %i41, align 1, !tbaa !21
  store i8 %i38, ptr %i43, align 1, !tbaa !21
  %i45 = getelementptr inbounds i8, ptr %i36, i64 8
  %i46 = add nuw nsw i32 %i37, 1
  %i47 = icmp eq i32 %i46, 8
  br i1 %i47, label %bb48, label %bb35.bb35_crit_edge, !llvm.loop !22

bb35.bb35_crit_edge:                              ; preds = %bb35
  br label %bb35

bb48:                                             ; preds = %bb35
  %i49 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 14
  store i64 %i3, ptr %i49, align 8, !tbaa !12
  %i50 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 15
  store i64 %i1, ptr %i50, align 8, !tbaa !12
  tail call fastcc void @sha_transform(ptr noundef %arg)
  ret void
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @sha_stream(ptr nocapture noundef %arg, ptr nocapture noundef %arg1) local_unnamed_addr #11 {
bb:
  %i = alloca [8192 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 8192, ptr nonnull %i) #12
  store i64 1732584193, ptr %arg, align 8, !tbaa !12
  %i2 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 1
  store i64 4023233417, ptr %i2, align 8, !tbaa !12
  %i3 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 2
  store i64 2562383102, ptr %i3, align 8, !tbaa !12
  %i4 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 3
  store i64 271733878, ptr %i4, align 8, !tbaa !12
  %i5 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 4
  store i64 3285377520, ptr %i5, align 8, !tbaa !12
  %i6 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 1
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i6, i8 0, i64 16, i1 false)
  %i7 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i8 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i9 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  %i10 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  br label %bb11

bb11:                                             ; preds = %bb50, %bb
  %i12 = call i64 @fread(ptr noundef nonnull %i, i64 noundef 1, i64 noundef 8192, ptr noundef %arg1)
  %i13 = trunc i64 %i12 to i32
  %i14 = icmp sgt i32 %i13, 0
  %i15 = load i64, ptr %i6, align 8, !tbaa !18
  br i1 %i14, label %bb16, label %bb54

bb16:                                             ; preds = %bb11
  %i17 = and i64 %i12, 4294967295
  %i18 = shl nuw nsw i64 %i17, 3
  %i19 = xor i64 %i15, -1
  %i20 = icmp ugt i64 %i18, %i19
  br i1 %i20, label %bb21, label %bb16.bb24_crit_edge

bb16.bb24_crit_edge:                              ; preds = %bb16
  br label %bb24

bb21:                                             ; preds = %bb16
  %i22 = load i64, ptr %i7, align 8, !tbaa !20
  %i23 = add i64 %i22, 1
  store i64 %i23, ptr %i7, align 8, !tbaa !20
  br label %bb24

bb24:                                             ; preds = %bb21, %bb16.bb24_crit_edge
  %i25 = add i64 %i15, %i18
  store i64 %i25, ptr %i6, align 8, !tbaa !18
  %i26 = lshr i64 %i17, 29
  %i27 = load i64, ptr %i8, align 8, !tbaa !20
  %i28 = add i64 %i27, %i26
  store i64 %i28, ptr %i8, align 8, !tbaa !20
  %i29 = icmp sgt i32 %i13, 63
  br i1 %i29, label %bb30.preheader, label %bb24.bb50_crit_edge

bb24.bb50_crit_edge:                              ; preds = %bb24
  br label %bb50

bb30.preheader:                                   ; preds = %bb24
  br label %bb30

bb30:                                             ; preds = %bb46.bb30_crit_edge, %bb30.preheader
  %i31 = phi i32 [ %i48, %bb46.bb30_crit_edge ], [ %i13, %bb30.preheader ]
  %i32 = phi ptr [ %i47, %bb46.bb30_crit_edge ], [ %i, %bb30.preheader ]
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(64) %i9, ptr noundef nonnull align 1 dereferenceable(64) %i32, i64 64, i1 false)
  br label %bb33

bb33:                                             ; preds = %bb33.bb33_crit_edge, %bb30
  %i34 = phi ptr [ %i9, %bb30 ], [ %i43, %bb33.bb33_crit_edge ]
  %i35 = phi i32 [ 0, %bb30 ], [ %i44, %bb33.bb33_crit_edge ]
  %i36 = load i8, ptr %i34, align 1, !tbaa !21
  %i37 = getelementptr inbounds i8, ptr %i34, i64 1
  %i38 = load i8, ptr %i37, align 1, !tbaa !21
  %i39 = getelementptr inbounds i8, ptr %i34, i64 2
  %i40 = load i8, ptr %i39, align 1, !tbaa !21
  %i41 = getelementptr inbounds i8, ptr %i34, i64 3
  %i42 = load i8, ptr %i41, align 1, !tbaa !21
  store i8 %i42, ptr %i34, align 1, !tbaa !21
  store i8 %i40, ptr %i37, align 1, !tbaa !21
  store i8 %i38, ptr %i39, align 1, !tbaa !21
  store i8 %i36, ptr %i41, align 1, !tbaa !21
  %i43 = getelementptr inbounds i8, ptr %i34, i64 8
  %i44 = add nuw nsw i32 %i35, 1
  %i45 = icmp eq i32 %i44, 8
  br i1 %i45, label %bb46, label %bb33.bb33_crit_edge, !llvm.loop !22

bb33.bb33_crit_edge:                              ; preds = %bb33
  br label %bb33

bb46:                                             ; preds = %bb33
  tail call fastcc void @sha_transform(ptr noundef nonnull %arg)
  %i47 = getelementptr inbounds i8, ptr %i32, i64 64
  %i48 = add nsw i32 %i31, -64
  %i49 = icmp sgt i32 %i31, 127
  br i1 %i49, label %bb46.bb30_crit_edge, label %bb50.loopexit, !llvm.loop !23

bb46.bb30_crit_edge:                              ; preds = %bb46
  br label %bb30

bb50.loopexit:                                    ; preds = %bb46
  br label %bb50

bb50:                                             ; preds = %bb50.loopexit, %bb24.bb50_crit_edge
  %i51 = phi ptr [ %i, %bb24.bb50_crit_edge ], [ %i47, %bb50.loopexit ]
  %i52 = phi i32 [ %i13, %bb24.bb50_crit_edge ], [ %i48, %bb50.loopexit ]
  %i53 = sext i32 %i52 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %i10, ptr nonnull align 1 %i51, i64 %i53, i1 false)
  br label %bb11, !llvm.loop !29

bb54:                                             ; preds = %bb11
  %i55 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i56 = load i64, ptr %i55, align 8, !tbaa !20
  %i57 = trunc i64 %i15 to i32
  %i58 = lshr i32 %i57, 3
  %i59 = and i32 %i58, 63
  %i60 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  %i61 = zext nneg i32 %i59 to i64
  %i62 = getelementptr inbounds i8, ptr %i60, i64 %i61
  store i8 -128, ptr %i62, align 1, !tbaa !21
  %i63 = icmp ugt i32 %i59, 55
  %i64 = zext nneg i32 %i59 to i64
  %i65 = getelementptr i8, ptr %i60, i64 %i64
  %i66 = getelementptr i8, ptr %i65, i64 1
  br i1 %i63, label %bb67, label %bb84

bb67:                                             ; preds = %bb54
  %i68 = xor i32 %i59, 63
  %i69 = zext nneg i32 %i68 to i64
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %i66, i8 0, i64 %i69, i1 false)
  br label %bb70

bb70:                                             ; preds = %bb70.bb70_crit_edge, %bb67
  %i71 = phi ptr [ %i60, %bb67 ], [ %i80, %bb70.bb70_crit_edge ]
  %i72 = phi i32 [ 0, %bb67 ], [ %i81, %bb70.bb70_crit_edge ]
  %i73 = load i8, ptr %i71, align 1, !tbaa !21
  %i74 = getelementptr inbounds i8, ptr %i71, i64 1
  %i75 = load i8, ptr %i74, align 1, !tbaa !21
  %i76 = getelementptr inbounds i8, ptr %i71, i64 2
  %i77 = load i8, ptr %i76, align 1, !tbaa !21
  %i78 = getelementptr inbounds i8, ptr %i71, i64 3
  %i79 = load i8, ptr %i78, align 1, !tbaa !21
  store i8 %i79, ptr %i71, align 1, !tbaa !21
  store i8 %i77, ptr %i74, align 1, !tbaa !21
  store i8 %i75, ptr %i76, align 1, !tbaa !21
  store i8 %i73, ptr %i78, align 1, !tbaa !21
  %i80 = getelementptr inbounds i8, ptr %i71, i64 8
  %i81 = add nuw nsw i32 %i72, 1
  %i82 = icmp eq i32 %i81, 8
  br i1 %i82, label %bb83, label %bb70.bb70_crit_edge, !llvm.loop !22

bb70.bb70_crit_edge:                              ; preds = %bb70
  br label %bb70

bb83:                                             ; preds = %bb70
  tail call fastcc void @sha_transform(ptr noundef nonnull %arg)
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %i60, i8 0, i64 56, i1 false)
  br label %bb87

bb84:                                             ; preds = %bb54
  %i85 = sub nuw nsw i32 55, %i59
  %i86 = zext nneg i32 %i85 to i64
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %i66, i8 0, i64 %i86, i1 false)
  br label %bb87

bb87:                                             ; preds = %bb84, %bb83
  br label %bb88

bb88:                                             ; preds = %bb88.bb88_crit_edge, %bb87
  %i89 = phi ptr [ %i98, %bb88.bb88_crit_edge ], [ %i60, %bb87 ]
  %i90 = phi i32 [ %i99, %bb88.bb88_crit_edge ], [ 0, %bb87 ]
  %i91 = load i8, ptr %i89, align 1, !tbaa !21
  %i92 = getelementptr inbounds i8, ptr %i89, i64 1
  %i93 = load i8, ptr %i92, align 1, !tbaa !21
  %i94 = getelementptr inbounds i8, ptr %i89, i64 2
  %i95 = load i8, ptr %i94, align 1, !tbaa !21
  %i96 = getelementptr inbounds i8, ptr %i89, i64 3
  %i97 = load i8, ptr %i96, align 1, !tbaa !21
  store i8 %i97, ptr %i89, align 1, !tbaa !21
  store i8 %i95, ptr %i92, align 1, !tbaa !21
  store i8 %i93, ptr %i94, align 1, !tbaa !21
  store i8 %i91, ptr %i96, align 1, !tbaa !21
  %i98 = getelementptr inbounds i8, ptr %i89, i64 8
  %i99 = add nuw nsw i32 %i90, 1
  %i100 = icmp eq i32 %i99, 8
  br i1 %i100, label %bb101, label %bb88.bb88_crit_edge, !llvm.loop !22

bb88.bb88_crit_edge:                              ; preds = %bb88
  br label %bb88

bb101:                                            ; preds = %bb88
  %i102 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 14
  store i64 %i56, ptr %i102, align 8, !tbaa !12
  %i103 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 15
  store i64 %i15, ptr %i103, align 8, !tbaa !12
  tail call fastcc void @sha_transform(ptr noundef nonnull %arg)
  call void @llvm.lifetime.end.p0(i64 8192, ptr nonnull %i) #12
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i64 @fread(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind uwtable
define dso_local void @sha_print(ptr nocapture noundef readonly %arg) local_unnamed_addr #11 {
bb:
  %i = load i64, ptr %arg, align 8, !tbaa !12
  %i1 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 1
  %i2 = load i64, ptr %i1, align 8, !tbaa !12
  %i3 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 2
  %i4 = load i64, ptr %i3, align 8, !tbaa !12
  %i5 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 3
  %i6 = load i64, ptr %i5, align 8, !tbaa !12
  %i7 = getelementptr inbounds [5 x i64], ptr %arg, i64 0, i64 4
  %i8 = load i64, ptr %i7, align 8, !tbaa !12
  %i9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i64 noundef %i, i64 noundef %i2, i64 noundef %i4, i64 noundef %i6, i64 noundef %i8)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nounwind }
attributes #13 = { cold }
attributes #14 = { noreturn nounwind }

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
!17 = distinct !{!17, !15, !16}
!18 = !{!19, !13, i64 40}
!19 = !{!"", !10, i64 0, !13, i64 40, !13, i64 48, !10, i64 56}
!20 = !{!19, !13, i64 48}
!21 = !{!10, !10, i64 0}
!22 = distinct !{!22, !15, !16}
!23 = distinct !{!23, !15, !16}
!24 = distinct !{!24, !15, !16}
!25 = distinct !{!25, !15, !16}
!26 = distinct !{!26, !15, !16}
!27 = distinct !{!27, !15, !16}
!28 = distinct !{!28, !15, !16}
!29 = distinct !{!29, !15, !16}
