; ModuleID = 'telecom_adpcm_d.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal unnamed_addr constant [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal unnamed_addr constant [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16
@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@state = dso_local global %struct.adpcm_state zeroinitializer, align 4
@abuf = dso_local global [500 x i8] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [11 x i8] c"input file\00", align 1
@sbuf = dso_local global [1000 x i16] zeroinitializer, align 16

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @adpcm_coder(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, i32 noundef %arg2, ptr nocapture noundef %arg3) local_unnamed_addr #0 {
bb:
  %i = load i16, ptr %arg3, align 2, !tbaa !8
  %i4 = getelementptr inbounds %struct.adpcm_state, ptr %arg3, i64 0, i32 1
  %i5 = load i8, ptr %i4, align 2, !tbaa !13
  %i6 = icmp sgt i32 %arg2, 0
  br i1 %i6, label %bb7, label %bb.bb85_crit_edge

bb.bb85_crit_edge:                                ; preds = %bb
  br label %bb85

bb7:                                              ; preds = %bb
  %i8 = sext i8 %i5 to i32
  %i9 = sext i16 %i to i32
  %i10 = sext i8 %i5 to i64
  %i11 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i10
  %i12 = load i32, ptr %i11, align 4, !tbaa !14
  br label %bb13

bb13:                                             ; preds = %bb74.bb13_crit_edge, %bb7
  %i14 = phi i32 [ %i77, %bb74.bb13_crit_edge ], [ 1, %bb7 ]
  %i15 = phi i32 [ %i76, %bb74.bb13_crit_edge ], [ 0, %bb7 ]
  %i16 = phi i32 [ %i62, %bb74.bb13_crit_edge ], [ %i8, %bb7 ]
  %i17 = phi i32 [ %i54, %bb74.bb13_crit_edge ], [ %i9, %bb7 ]
  %i18 = phi i32 [ %i65, %bb74.bb13_crit_edge ], [ %i12, %bb7 ]
  %i19 = phi i32 [ %i78, %bb74.bb13_crit_edge ], [ %arg2, %bb7 ]
  %i20 = phi ptr [ %i22, %bb74.bb13_crit_edge ], [ %arg, %bb7 ]
  %i21 = phi ptr [ %i75, %bb74.bb13_crit_edge ], [ %arg1, %bb7 ]
  %i22 = getelementptr inbounds i16, ptr %i20, i64 1
  %i23 = load i16, ptr %i20, align 2, !tbaa !16
  %i24 = sext i16 %i23 to i32
  %i25 = sub nsw i32 %i24, %i17
  %i26 = icmp slt i32 %i25, 0
  %i27 = lshr i32 %i25, 28
  %i28 = and i32 %i27, 8
  %i29 = tail call i32 @llvm.abs.i32(i32 %i25, i1 true)
  %i30 = ashr i32 %i18, 3
  %i31 = icmp slt i32 %i29, %i18
  %i32 = select i1 %i31, i32 0, i32 4
  %i33 = select i1 %i31, i32 0, i32 %i18
  %i34 = sub nsw i32 %i29, %i33
  %i35 = select i1 %i31, i32 0, i32 %i18
  %i36 = add nsw i32 %i35, %i30
  %i37 = ashr i32 %i18, 1
  %i38 = icmp slt i32 %i34, %i37
  %i39 = or disjoint i32 %i32, 2
  %i40 = select i1 %i38, i32 %i32, i32 %i39
  %i41 = select i1 %i38, i32 0, i32 %i37
  %i42 = sub nsw i32 %i34, %i41
  %i43 = select i1 %i38, i32 0, i32 %i37
  %i44 = add nsw i32 %i36, %i43
  %i45 = ashr i32 %i18, 2
  %i46 = icmp sge i32 %i42, %i45
  %i47 = zext i1 %i46 to i32
  %i48 = select i1 %i46, i32 %i45, i32 0
  %i49 = add nsw i32 %i44, %i48
  %i50 = sub i32 0, %i49
  %i51 = select i1 %i26, i32 %i50, i32 %i49
  %i52 = add i32 %i51, %i17
  %i53 = tail call i32 @llvm.smax.i32(i32 %i52, i32 -32768)
  %i54 = tail call i32 @llvm.smin.i32(i32 %i53, i32 32767)
  %i55 = or disjoint i32 %i40, %i28
  %i56 = or disjoint i32 %i55, %i47
  %i57 = zext nneg i32 %i56 to i64
  %i58 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %i57
  %i59 = load i32, ptr %i58, align 4, !tbaa !14
  %i60 = add nsw i32 %i59, %i16
  %i61 = tail call i32 @llvm.smax.i32(i32 %i60, i32 0)
  %i62 = tail call i32 @llvm.umin.i32(i32 %i61, i32 88)
  %i63 = zext nneg i32 %i62 to i64
  %i64 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i63
  %i65 = load i32, ptr %i64, align 4, !tbaa !14
  %i66 = icmp eq i32 %i14, 0
  br i1 %i66, label %bb70, label %bb67

bb67:                                             ; preds = %bb13
  %i68 = shl nuw nsw i32 %i56, 4
  %i69 = and i32 %i68, 240
  br label %bb74

bb70:                                             ; preds = %bb13
  %i71 = or i32 %i56, %i15
  %i72 = trunc i32 %i71 to i8
  %i73 = getelementptr inbounds i8, ptr %i21, i64 1
  store i8 %i72, ptr %i21, align 1, !tbaa !17
  br label %bb74

bb74:                                             ; preds = %bb70, %bb67
  %i75 = phi ptr [ %i21, %bb67 ], [ %i73, %bb70 ]
  %i76 = phi i32 [ %i69, %bb67 ], [ %i15, %bb70 ]
  %i77 = xor i32 %i14, 1
  %i78 = add nsw i32 %i19, -1
  %i79 = icmp sgt i32 %i19, 1
  br i1 %i79, label %bb74.bb13_crit_edge, label %bb80, !llvm.loop !18

bb74.bb13_crit_edge:                              ; preds = %bb74
  br label %bb13

bb80:                                             ; preds = %bb74
  %i81 = icmp eq i32 %i77, 0
  %i82 = trunc i32 %i76 to i8
  %i83 = trunc i32 %i54 to i16
  %i84 = trunc i32 %i62 to i8
  br label %bb85

bb85:                                             ; preds = %bb.bb85_crit_edge, %bb80
  %i86 = phi ptr [ %arg1, %bb.bb85_crit_edge ], [ %i75, %bb80 ]
  %i87 = phi i16 [ %i, %bb.bb85_crit_edge ], [ %i83, %bb80 ]
  %i88 = phi i8 [ %i5, %bb.bb85_crit_edge ], [ %i84, %bb80 ]
  %i89 = phi i8 [ 0, %bb.bb85_crit_edge ], [ %i82, %bb80 ]
  %i90 = phi i1 [ false, %bb.bb85_crit_edge ], [ %i81, %bb80 ]
  br i1 %i90, label %bb91, label %bb85.bb92_crit_edge

bb85.bb92_crit_edge:                              ; preds = %bb85
  br label %bb92

bb91:                                             ; preds = %bb85
  store i8 %i89, ptr %i86, align 1, !tbaa !17
  br label %bb92

bb92:                                             ; preds = %bb85.bb92_crit_edge, %bb91
  store i16 %i87, ptr %arg3, align 2, !tbaa !8
  store i8 %i88, ptr %i4, align 2, !tbaa !13
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #1

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @adpcm_decoder(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, i32 noundef %arg2, ptr nocapture noundef %arg3) local_unnamed_addr #0 {
bb:
  %i = load i16, ptr %arg3, align 2, !tbaa !8
  %i4 = getelementptr inbounds %struct.adpcm_state, ptr %arg3, i64 0, i32 1
  %i5 = load i8, ptr %i4, align 2, !tbaa !13
  %i6 = icmp sgt i32 %arg2, 0
  br i1 %i6, label %bb7, label %bb.bb72_crit_edge

bb.bb72_crit_edge:                                ; preds = %bb
  br label %bb72

bb7:                                              ; preds = %bb
  %i8 = sext i8 %i5 to i32
  %i9 = sext i16 %i to i32
  %i10 = sext i8 %i5 to i64
  %i11 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i10
  %i12 = load i32, ptr %i11, align 4, !tbaa !14
  br label %bb13

bb13:                                             ; preds = %bb28.bb13_crit_edge, %bb7
  %i14 = phi i32 [ %i33, %bb28.bb13_crit_edge ], [ 0, %bb7 ]
  %i15 = phi i32 [ %i31, %bb28.bb13_crit_edge ], [ 0, %bb7 ]
  %i16 = phi i32 [ %i39, %bb28.bb13_crit_edge ], [ %i8, %bb7 ]
  %i17 = phi i32 [ %i61, %bb28.bb13_crit_edge ], [ %i9, %bb7 ]
  %i18 = phi i32 [ %i64, %bb28.bb13_crit_edge ], [ %i12, %bb7 ]
  %i19 = phi i32 [ %i67, %bb28.bb13_crit_edge ], [ %arg2, %bb7 ]
  %i20 = phi ptr [ %i66, %bb28.bb13_crit_edge ], [ %arg1, %bb7 ]
  %i21 = phi ptr [ %i29, %bb28.bb13_crit_edge ], [ %arg, %bb7 ]
  %i22 = icmp eq i32 %i14, 0
  br i1 %i22, label %bb23, label %bb13.bb28_crit_edge

bb13.bb28_crit_edge:                              ; preds = %bb13
  br label %bb28

bb23:                                             ; preds = %bb13
  %i24 = getelementptr inbounds i8, ptr %i21, i64 1
  %i25 = load i8, ptr %i21, align 1, !tbaa !17
  %i26 = zext i8 %i25 to i32
  %i27 = lshr i32 %i26, 4
  br label %bb28

bb28:                                             ; preds = %bb13.bb28_crit_edge, %bb23
  %i29 = phi ptr [ %i24, %bb23 ], [ %i21, %bb13.bb28_crit_edge ]
  %i30 = phi i32 [ %i27, %bb23 ], [ %i15, %bb13.bb28_crit_edge ]
  %i31 = phi i32 [ %i26, %bb23 ], [ %i15, %bb13.bb28_crit_edge ]
  %i32 = and i32 %i30, 15
  %i33 = xor i32 %i14, 1
  %i34 = zext nneg i32 %i32 to i64
  %i35 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %i34
  %i36 = load i32, ptr %i35, align 4, !tbaa !14
  %i37 = add nsw i32 %i36, %i16
  %i38 = tail call i32 @llvm.smax.i32(i32 %i37, i32 0)
  %i39 = tail call i32 @llvm.umin.i32(i32 %i38, i32 88)
  %i40 = and i32 %i30, 8
  %i41 = ashr i32 %i18, 3
  %i42 = and i32 %i30, 4
  %i43 = icmp eq i32 %i42, 0
  %i44 = select i1 %i43, i32 0, i32 %i18
  %i45 = add nsw i32 %i44, %i41
  %i46 = and i32 %i30, 2
  %i47 = icmp eq i32 %i46, 0
  %i48 = ashr i32 %i18, 1
  %i49 = select i1 %i47, i32 0, i32 %i48
  %i50 = add nsw i32 %i45, %i49
  %i51 = and i32 %i30, 1
  %i52 = icmp eq i32 %i51, 0
  %i53 = ashr i32 %i18, 2
  %i54 = select i1 %i52, i32 0, i32 %i53
  %i55 = add nsw i32 %i50, %i54
  %i56 = icmp eq i32 %i40, 0
  %i57 = sub i32 0, %i55
  %i58 = select i1 %i56, i32 %i55, i32 %i57
  %i59 = add i32 %i58, %i17
  %i60 = tail call i32 @llvm.smax.i32(i32 %i59, i32 -32768)
  %i61 = tail call i32 @llvm.smin.i32(i32 %i60, i32 32767)
  %i62 = zext nneg i32 %i39 to i64
  %i63 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %i62
  %i64 = load i32, ptr %i63, align 4, !tbaa !14
  %i65 = trunc i32 %i61 to i16
  %i66 = getelementptr inbounds i16, ptr %i20, i64 1
  store i16 %i65, ptr %i20, align 2, !tbaa !16
  %i67 = add nsw i32 %i19, -1
  %i68 = icmp sgt i32 %i19, 1
  br i1 %i68, label %bb28.bb13_crit_edge, label %bb69, !llvm.loop !21

bb28.bb13_crit_edge:                              ; preds = %bb28
  br label %bb13

bb69:                                             ; preds = %bb28
  %i70 = trunc i32 %i61 to i16
  %i71 = trunc i32 %i39 to i8
  br label %bb72

bb72:                                             ; preds = %bb.bb72_crit_edge, %bb69
  %i73 = phi i16 [ %i, %bb.bb72_crit_edge ], [ %i70, %bb69 ]
  %i74 = phi i8 [ %i5, %bb.bb72_crit_edge ], [ %i71, %bb69 ]
  store i16 %i73, ptr %arg3, align 2, !tbaa !8
  store i8 %i74, ptr %i4, align 2, !tbaa !13
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #2 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #9
  %i1 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i2 = icmp eq ptr %i1, null
  br i1 %i2, label %bb3, label %bb6

bb3:                                              ; preds = %bb
  %i4 = load ptr, ptr @stderr, align 8, !tbaa !22
  %i5 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i4) #10
  tail call void @exit(i32 noundef 1) #11
  unreachable

bb6:                                              ; preds = %bb
  %i7 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i1, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #9
  %i8 = call i32 @fclose(ptr noundef nonnull %i1)
  br label %bb9

bb9:                                              ; preds = %bb27.bb9_crit_edge, %bb6
  %i10 = load i32, ptr @state, align 4
  %i11 = call i64 @read(i32 noundef 0, ptr noundef nonnull @abuf, i64 noundef 500) #9
  %i12 = trunc i64 %i11 to i32
  %i13 = icmp slt i32 %i12, 0
  br i1 %i13, label %bb14, label %bb15

bb14:                                             ; preds = %bb9
  call void @perror(ptr noundef nonnull @.str.4) #10
  call void @exit(i32 noundef 1) #11
  unreachable

bb15:                                             ; preds = %bb9
  %i16 = icmp eq i32 %i12, 0
  br i1 %i16, label %bb15.bb31_crit_edge, label %bb17

bb15.bb31_crit_edge:                              ; preds = %bb15
  br label %bb31

bb17:                                             ; preds = %bb15
  %i18 = load i64, ptr %i, align 8, !tbaa !24
  %i19 = icmp sgt i64 %i18, 0
  br i1 %i19, label %bb20, label %bb17.bb27_crit_edge

bb17.bb27_crit_edge:                              ; preds = %bb17
  br label %bb27

bb20:                                             ; preds = %bb17
  %i21 = shl nuw nsw i32 %i12, 1
  br label %bb22

bb22:                                             ; preds = %bb22.bb22_crit_edge, %bb20
  %i23 = phi i64 [ 0, %bb20 ], [ %i24, %bb22.bb22_crit_edge ]
  store i32 %i10, ptr @state, align 4
  call void @adpcm_decoder(ptr noundef nonnull @abuf, ptr noundef nonnull @sbuf, i32 noundef %i21, ptr noundef nonnull @state) #9
  %i24 = add nuw nsw i64 %i23, 1
  %i25 = load i64, ptr %i, align 8, !tbaa !24
  %i26 = icmp slt i64 %i24, %i25
  br i1 %i26, label %bb22.bb22_crit_edge, label %bb27.loopexit, !llvm.loop !26

bb22.bb22_crit_edge:                              ; preds = %bb22
  br label %bb22

bb27.loopexit:                                    ; preds = %bb22
  br label %bb27

bb27:                                             ; preds = %bb17.bb27_crit_edge, %bb27.loopexit
  %i28 = shl i64 %i11, 2
  %i29 = and i64 %i28, 4294967292
  %i30 = call i64 @write(i32 noundef 1, ptr noundef nonnull @sbuf, i64 noundef %i29) #9
  br i1 %i16, label %bb31split, label %bb27.bb9_crit_edge

bb27.bb9_crit_edge:                               ; preds = %bb27
  br label %bb9

bb31split:                                        ; preds = %bb27
  br label %bb31

bb31:                                             ; preds = %bb31split, %bb15.bb31_crit_edge
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #9
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #6

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, ptr nocapture noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare void @perror(ptr nocapture noundef readonly) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, ptr nocapture noundef readonly, i64 noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { cold }
attributes #11 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = !{!9, !10, i64 0}
!9 = !{!"adpcm_state", !10, i64 0, !11, i64 2}
!10 = !{!"short", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !{!9, !11, i64 2}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !11, i64 0}
!16 = !{!10, !10, i64 0}
!17 = !{!11, !11, i64 0}
!18 = distinct !{!18, !19, !20}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !19, !20}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !11, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"long", !11, i64 0}
!26 = distinct !{!26, !19, !20}
