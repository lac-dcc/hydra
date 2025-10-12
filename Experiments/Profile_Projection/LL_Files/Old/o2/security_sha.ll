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
  br i1 %i3, label %bb7, label %bb4

bb4:                                              ; preds = %bb
  %i5 = add nsw i32 %arg, -1
  %i6 = icmp eq i32 %arg2, 0
  br label %bb11

bb7:                                              ; preds = %bb
  %i8 = load ptr, ptr @stdin, align 8, !tbaa !8
  call void @sha_stream(ptr noundef nonnull %i, ptr noundef %i8) #12
  %i9 = icmp eq i32 %arg2, 0
  br i1 %i9, label %bb7.bb28_crit_edge, label %bb10

bb7.bb28_crit_edge:                               ; preds = %bb7
  br label %bb28

bb10:                                             ; preds = %bb7
  call void @sha_print(ptr noundef nonnull %i) #12
  br label %bb28

bb11:                                             ; preds = %bb24.bb11_crit_edge, %bb4
  %i12 = phi i32 [ %i5, %bb4 ], [ %i26, %bb24.bb11_crit_edge ]
  %i13 = phi ptr [ %arg1, %bb4 ], [ %i14, %bb24.bb11_crit_edge ]
  %i14 = getelementptr inbounds ptr, ptr %i13, i64 1
  %i15 = load ptr, ptr %i14, align 8, !tbaa !8
  %i16 = call noalias ptr @fopen(ptr noundef %i15, ptr noundef nonnull @.str.4)
  %i17 = icmp eq ptr %i16, null
  br i1 %i17, label %bb18, label %bb22

bb18:                                             ; preds = %bb11
  %i19 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i20 = load ptr, ptr %i14, align 8, !tbaa !8
  %i21 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i19, ptr noundef nonnull @.str.1.5, ptr noundef %i20) #13
  call void @exit(i32 noundef 1) #14
  unreachable

bb22:                                             ; preds = %bb11
  call void @sha_stream(ptr noundef nonnull %i, ptr noundef nonnull %i16) #12
  br i1 %i6, label %bb22.bb24_crit_edge, label %bb23

bb22.bb24_crit_edge:                              ; preds = %bb22
  br label %bb24

bb23:                                             ; preds = %bb22
  call void @sha_print(ptr noundef nonnull %i) #12
  br label %bb24

bb24:                                             ; preds = %bb23, %bb22.bb24_crit_edge
  %i25 = call i32 @fclose(ptr noundef nonnull %i16)
  %i26 = add nsw i32 %i12, -1
  %i27 = icmp eq i32 %i26, 0
  br i1 %i27, label %bb28.loopexit, label %bb24.bb11_crit_edge, !llvm.loop !16

bb24.bb11_crit_edge:                              ; preds = %bb24
  br label %bb11

bb28.loopexit:                                    ; preds = %bb24
  br label %bb28

bb28:                                             ; preds = %bb28.loopexit, %bb10, %bb7.bb28_crit_edge
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
define dso_local void @sha_update(ptr noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #8 {
bb:
  %i = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 1
  %i3 = load i64, ptr %i, align 8, !tbaa !17
  %i4 = sext i32 %arg2 to i64
  %i5 = shl nsw i64 %i4, 3
  %i6 = xor i64 %i3, -1
  %i7 = icmp ugt i64 %i5, %i6
  %i8 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i9 = load i64, ptr %i8, align 8, !tbaa !19
  %i10 = zext i1 %i7 to i64
  %i11 = add i64 %i9, %i10
  %i12 = add i64 %i3, %i5
  store i64 %i12, ptr %i, align 8, !tbaa !17
  %i13 = lshr i64 %i4, 29
  %i14 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i15 = add i64 %i11, %i13
  store i64 %i15, ptr %i14, align 8, !tbaa !19
  %i16 = icmp sgt i32 %arg2, 63
  br i1 %i16, label %bb17, label %bb.bb90_crit_edge

bb.bb90_crit_edge:                                ; preds = %bb
  br label %bb90

bb17:                                             ; preds = %bb
  %i18 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  %i19 = getelementptr inbounds i8, ptr %arg, i64 57
  %i20 = getelementptr inbounds i8, ptr %arg, i64 58
  %i21 = getelementptr inbounds i8, ptr %arg, i64 59
  %i22 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 1
  %i23 = getelementptr inbounds i8, ptr %arg, i64 65
  %i24 = getelementptr inbounds i8, ptr %arg, i64 66
  %i25 = getelementptr inbounds i8, ptr %arg, i64 67
  %i26 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 2
  %i27 = getelementptr inbounds i8, ptr %arg, i64 73
  %i28 = getelementptr inbounds i8, ptr %arg, i64 74
  %i29 = getelementptr inbounds i8, ptr %arg, i64 75
  %i30 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 3
  %i31 = getelementptr inbounds i8, ptr %arg, i64 81
  %i32 = getelementptr inbounds i8, ptr %arg, i64 82
  %i33 = getelementptr inbounds i8, ptr %arg, i64 83
  %i34 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 4
  %i35 = getelementptr inbounds i8, ptr %arg, i64 89
  %i36 = getelementptr inbounds i8, ptr %arg, i64 90
  %i37 = getelementptr inbounds i8, ptr %arg, i64 91
  %i38 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 5
  %i39 = getelementptr inbounds i8, ptr %arg, i64 97
  %i40 = getelementptr inbounds i8, ptr %arg, i64 98
  %i41 = getelementptr inbounds i8, ptr %arg, i64 99
  %i42 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 6
  %i43 = getelementptr inbounds i8, ptr %arg, i64 105
  %i44 = getelementptr inbounds i8, ptr %arg, i64 106
  %i45 = getelementptr inbounds i8, ptr %arg, i64 107
  %i46 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 7
  %i47 = getelementptr inbounds i8, ptr %arg, i64 113
  %i48 = getelementptr inbounds i8, ptr %arg, i64 114
  %i49 = getelementptr inbounds i8, ptr %arg, i64 115
  br label %bb50

bb50:                                             ; preds = %bb50.bb50_crit_edge, %bb17
  %i51 = phi i32 [ %arg2, %bb17 ], [ %i86, %bb50.bb50_crit_edge ]
  %i52 = phi ptr [ %arg1, %bb17 ], [ %i85, %bb50.bb50_crit_edge ]
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(64) %i18, ptr noundef nonnull align 1 dereferenceable(64) %i52, i64 64, i1 false)
  %i53 = load i8, ptr %i18, align 1, !tbaa !20
  %i54 = load i8, ptr %i19, align 1, !tbaa !20
  %i55 = load i8, ptr %i20, align 1, !tbaa !20
  %i56 = load i8, ptr %i21, align 1, !tbaa !20
  store i8 %i56, ptr %i18, align 1, !tbaa !20
  store i8 %i55, ptr %i19, align 1, !tbaa !20
  store i8 %i54, ptr %i20, align 1, !tbaa !20
  store i8 %i53, ptr %i21, align 1, !tbaa !20
  %i57 = load i8, ptr %i22, align 1, !tbaa !20
  %i58 = load i8, ptr %i23, align 1, !tbaa !20
  %i59 = load i8, ptr %i24, align 1, !tbaa !20
  %i60 = load i8, ptr %i25, align 1, !tbaa !20
  store i8 %i60, ptr %i22, align 1, !tbaa !20
  store i8 %i59, ptr %i23, align 1, !tbaa !20
  store i8 %i58, ptr %i24, align 1, !tbaa !20
  store i8 %i57, ptr %i25, align 1, !tbaa !20
  %i61 = load i8, ptr %i26, align 1, !tbaa !20
  %i62 = load i8, ptr %i27, align 1, !tbaa !20
  %i63 = load i8, ptr %i28, align 1, !tbaa !20
  %i64 = load i8, ptr %i29, align 1, !tbaa !20
  store i8 %i64, ptr %i26, align 1, !tbaa !20
  store i8 %i63, ptr %i27, align 1, !tbaa !20
  store i8 %i62, ptr %i28, align 1, !tbaa !20
  store i8 %i61, ptr %i29, align 1, !tbaa !20
  %i65 = load i8, ptr %i30, align 1, !tbaa !20
  %i66 = load i8, ptr %i31, align 1, !tbaa !20
  %i67 = load i8, ptr %i32, align 1, !tbaa !20
  %i68 = load i8, ptr %i33, align 1, !tbaa !20
  store i8 %i68, ptr %i30, align 1, !tbaa !20
  store i8 %i67, ptr %i31, align 1, !tbaa !20
  store i8 %i66, ptr %i32, align 1, !tbaa !20
  store i8 %i65, ptr %i33, align 1, !tbaa !20
  %i69 = load i8, ptr %i34, align 1, !tbaa !20
  %i70 = load i8, ptr %i35, align 1, !tbaa !20
  %i71 = load i8, ptr %i36, align 1, !tbaa !20
  %i72 = load i8, ptr %i37, align 1, !tbaa !20
  store i8 %i72, ptr %i34, align 1, !tbaa !20
  store i8 %i71, ptr %i35, align 1, !tbaa !20
  store i8 %i70, ptr %i36, align 1, !tbaa !20
  store i8 %i69, ptr %i37, align 1, !tbaa !20
  %i73 = load i8, ptr %i38, align 1, !tbaa !20
  %i74 = load i8, ptr %i39, align 1, !tbaa !20
  %i75 = load i8, ptr %i40, align 1, !tbaa !20
  %i76 = load i8, ptr %i41, align 1, !tbaa !20
  store i8 %i76, ptr %i38, align 1, !tbaa !20
  store i8 %i75, ptr %i39, align 1, !tbaa !20
  store i8 %i74, ptr %i40, align 1, !tbaa !20
  store i8 %i73, ptr %i41, align 1, !tbaa !20
  %i77 = load i8, ptr %i42, align 1, !tbaa !20
  %i78 = load i8, ptr %i43, align 1, !tbaa !20
  %i79 = load i8, ptr %i44, align 1, !tbaa !20
  %i80 = load i8, ptr %i45, align 1, !tbaa !20
  store i8 %i80, ptr %i42, align 1, !tbaa !20
  store i8 %i79, ptr %i43, align 1, !tbaa !20
  store i8 %i78, ptr %i44, align 1, !tbaa !20
  store i8 %i77, ptr %i45, align 1, !tbaa !20
  %i81 = load i8, ptr %i46, align 1, !tbaa !20
  %i82 = load i8, ptr %i47, align 1, !tbaa !20
  %i83 = load i8, ptr %i48, align 1, !tbaa !20
  %i84 = load i8, ptr %i49, align 1, !tbaa !20
  store i8 %i84, ptr %i46, align 1, !tbaa !20
  store i8 %i83, ptr %i47, align 1, !tbaa !20
  store i8 %i82, ptr %i48, align 1, !tbaa !20
  store i8 %i81, ptr %i49, align 1, !tbaa !20
  tail call fastcc void @sha_transform(ptr noundef nonnull %arg)
  %i85 = getelementptr inbounds i8, ptr %i52, i64 64
  %i86 = add nsw i32 %i51, -64
  %i87 = icmp ugt i32 %i51, 127
  br i1 %i87, label %bb50.bb50_crit_edge, label %bb88, !llvm.loop !21

bb50.bb50_crit_edge:                              ; preds = %bb50
  br label %bb50

bb88:                                             ; preds = %bb50
  %i89 = zext nneg i32 %i86 to i64
  br label %bb90

bb90:                                             ; preds = %bb88, %bb.bb90_crit_edge
  %i91 = phi i64 [ %i89, %bb88 ], [ %i4, %bb.bb90_crit_edge ]
  %i92 = phi ptr [ %i85, %bb88 ], [ %arg1, %bb.bb90_crit_edge ]
  %i93 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %i93, ptr align 1 %i92, i64 %i91, i1 false)
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
  br i1 %i21, label %bb22, label %bb2.bb2_crit_edge, !llvm.loop !22

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
  br i1 %i56, label %bb57.preheader, label %bb32.bb32_crit_edge, !llvm.loop !23

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
  br i1 %i79, label %bb80.preheader, label %bb57.bb57_crit_edge, !llvm.loop !24

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
  br i1 %i104, label %bb105.preheader, label %bb80.bb80_crit_edge, !llvm.loop !25

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
  br i1 %i127, label %bb128, label %bb105.bb105_crit_edge, !llvm.loop !26

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

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @sha_final(ptr noundef %arg) local_unnamed_addr #10 {
bb:
  %i = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 1
  %i1 = load i64, ptr %i, align 8, !tbaa !17
  %i2 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 2
  %i3 = load i64, ptr %i2, align 8, !tbaa !19
  %i4 = trunc i64 %i1 to i32
  %i5 = lshr i32 %i4, 3
  %i6 = and i32 %i5, 63
  %i7 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3
  %i8 = zext nneg i32 %i6 to i64
  %i9 = getelementptr inbounds i8, ptr %i7, i64 %i8
  store i8 -128, ptr %i9, align 1, !tbaa !20
  %i10 = icmp ugt i32 %i6, 55
  %i11 = zext nneg i32 %i6 to i64
  %i12 = getelementptr i8, ptr %i7, i64 %i11
  %i13 = getelementptr i8, ptr %i12, i64 1
  %i14 = getelementptr inbounds i8, ptr %arg, i64 57
  %i15 = getelementptr inbounds i8, ptr %arg, i64 58
  %i16 = getelementptr inbounds i8, ptr %arg, i64 59
  br i1 %i10, label %bb17, label %bb80

bb17:                                             ; preds = %bb
  %i18 = xor i32 %i6, 63
  %i19 = zext nneg i32 %i18 to i64
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %i13, i8 0, i64 %i19, i1 false)
  %i20 = load i8, ptr %i7, align 1, !tbaa !20
  %i21 = load i8, ptr %i14, align 1, !tbaa !20
  %i22 = load i8, ptr %i15, align 1, !tbaa !20
  %i23 = load i8, ptr %i16, align 1, !tbaa !20
  store i8 %i23, ptr %i7, align 1, !tbaa !20
  store i8 %i22, ptr %i14, align 1, !tbaa !20
  store i8 %i21, ptr %i15, align 1, !tbaa !20
  store i8 %i20, ptr %i16, align 1, !tbaa !20
  %i24 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 1
  %i25 = load i8, ptr %i24, align 1, !tbaa !20
  %i26 = getelementptr inbounds i8, ptr %arg, i64 65
  %i27 = load i8, ptr %i26, align 1, !tbaa !20
  %i28 = getelementptr inbounds i8, ptr %arg, i64 66
  %i29 = load i8, ptr %i28, align 1, !tbaa !20
  %i30 = getelementptr inbounds i8, ptr %arg, i64 67
  %i31 = load i8, ptr %i30, align 1, !tbaa !20
  store i8 %i31, ptr %i24, align 1, !tbaa !20
  store i8 %i29, ptr %i26, align 1, !tbaa !20
  store i8 %i27, ptr %i28, align 1, !tbaa !20
  store i8 %i25, ptr %i30, align 1, !tbaa !20
  %i32 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 2
  %i33 = load i8, ptr %i32, align 1, !tbaa !20
  %i34 = getelementptr inbounds i8, ptr %arg, i64 73
  %i35 = load i8, ptr %i34, align 1, !tbaa !20
  %i36 = getelementptr inbounds i8, ptr %arg, i64 74
  %i37 = load i8, ptr %i36, align 1, !tbaa !20
  %i38 = getelementptr inbounds i8, ptr %arg, i64 75
  %i39 = load i8, ptr %i38, align 1, !tbaa !20
  store i8 %i39, ptr %i32, align 1, !tbaa !20
  store i8 %i37, ptr %i34, align 1, !tbaa !20
  store i8 %i35, ptr %i36, align 1, !tbaa !20
  store i8 %i33, ptr %i38, align 1, !tbaa !20
  %i40 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 3
  %i41 = load i8, ptr %i40, align 1, !tbaa !20
  %i42 = getelementptr inbounds i8, ptr %arg, i64 81
  %i43 = load i8, ptr %i42, align 1, !tbaa !20
  %i44 = getelementptr inbounds i8, ptr %arg, i64 82
  %i45 = load i8, ptr %i44, align 1, !tbaa !20
  %i46 = getelementptr inbounds i8, ptr %arg, i64 83
  %i47 = load i8, ptr %i46, align 1, !tbaa !20
  store i8 %i47, ptr %i40, align 1, !tbaa !20
  store i8 %i45, ptr %i42, align 1, !tbaa !20
  store i8 %i43, ptr %i44, align 1, !tbaa !20
  store i8 %i41, ptr %i46, align 1, !tbaa !20
  %i48 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 4
  %i49 = load i8, ptr %i48, align 1, !tbaa !20
  %i50 = getelementptr inbounds i8, ptr %arg, i64 89
  %i51 = load i8, ptr %i50, align 1, !tbaa !20
  %i52 = getelementptr inbounds i8, ptr %arg, i64 90
  %i53 = load i8, ptr %i52, align 1, !tbaa !20
  %i54 = getelementptr inbounds i8, ptr %arg, i64 91
  %i55 = load i8, ptr %i54, align 1, !tbaa !20
  store i8 %i55, ptr %i48, align 1, !tbaa !20
  store i8 %i53, ptr %i50, align 1, !tbaa !20
  store i8 %i51, ptr %i52, align 1, !tbaa !20
  store i8 %i49, ptr %i54, align 1, !tbaa !20
  %i56 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 5
  %i57 = load i8, ptr %i56, align 1, !tbaa !20
  %i58 = getelementptr inbounds i8, ptr %arg, i64 97
  %i59 = load i8, ptr %i58, align 1, !tbaa !20
  %i60 = getelementptr inbounds i8, ptr %arg, i64 98
  %i61 = load i8, ptr %i60, align 1, !tbaa !20
  %i62 = getelementptr inbounds i8, ptr %arg, i64 99
  %i63 = load i8, ptr %i62, align 1, !tbaa !20
  store i8 %i63, ptr %i56, align 1, !tbaa !20
  store i8 %i61, ptr %i58, align 1, !tbaa !20
  store i8 %i59, ptr %i60, align 1, !tbaa !20
  store i8 %i57, ptr %i62, align 1, !tbaa !20
  %i64 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 6
  %i65 = load i8, ptr %i64, align 1, !tbaa !20
  %i66 = getelementptr inbounds i8, ptr %arg, i64 105
  %i67 = load i8, ptr %i66, align 1, !tbaa !20
  %i68 = getelementptr inbounds i8, ptr %arg, i64 106
  %i69 = load i8, ptr %i68, align 1, !tbaa !20
  %i70 = getelementptr inbounds i8, ptr %arg, i64 107
  %i71 = load i8, ptr %i70, align 1, !tbaa !20
  store i8 %i71, ptr %i64, align 1, !tbaa !20
  store i8 %i69, ptr %i66, align 1, !tbaa !20
  store i8 %i67, ptr %i68, align 1, !tbaa !20
  store i8 %i65, ptr %i70, align 1, !tbaa !20
  %i72 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 7
  %i73 = load i8, ptr %i72, align 1, !tbaa !20
  %i74 = getelementptr inbounds i8, ptr %arg, i64 113
  %i75 = load i8, ptr %i74, align 1, !tbaa !20
  %i76 = getelementptr inbounds i8, ptr %arg, i64 114
  %i77 = load i8, ptr %i76, align 1, !tbaa !20
  %i78 = getelementptr inbounds i8, ptr %arg, i64 115
  %i79 = load i8, ptr %i78, align 1, !tbaa !20
  store i8 %i79, ptr %i72, align 1, !tbaa !20
  store i8 %i77, ptr %i74, align 1, !tbaa !20
  store i8 %i75, ptr %i76, align 1, !tbaa !20
  store i8 %i73, ptr %i78, align 1, !tbaa !20
  tail call fastcc void @sha_transform(ptr noundef nonnull %arg)
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %i7, i8 0, i64 56, i1 false)
  br label %bb135

bb80:                                             ; preds = %bb
  %i81 = sub nuw nsw i32 55, %i6
  %i82 = zext nneg i32 %i81 to i64
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %i13, i8 0, i64 %i82, i1 false)
  %i83 = load i8, ptr %i7, align 1, !tbaa !20
  %i84 = load i8, ptr %i14, align 1, !tbaa !20
  %i85 = load i8, ptr %i15, align 1, !tbaa !20
  %i86 = load i8, ptr %i16, align 1, !tbaa !20
  %i87 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 1
  %i88 = load i8, ptr %i87, align 1, !tbaa !20
  %i89 = getelementptr inbounds i8, ptr %arg, i64 65
  %i90 = load i8, ptr %i89, align 1, !tbaa !20
  %i91 = getelementptr inbounds i8, ptr %arg, i64 66
  %i92 = load i8, ptr %i91, align 1, !tbaa !20
  %i93 = getelementptr inbounds i8, ptr %arg, i64 67
  %i94 = load i8, ptr %i93, align 1, !tbaa !20
  %i95 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 2
  %i96 = load i8, ptr %i95, align 1, !tbaa !20
  %i97 = getelementptr inbounds i8, ptr %arg, i64 73
  %i98 = load i8, ptr %i97, align 1, !tbaa !20
  %i99 = getelementptr inbounds i8, ptr %arg, i64 74
  %i100 = load i8, ptr %i99, align 1, !tbaa !20
  %i101 = getelementptr inbounds i8, ptr %arg, i64 75
  %i102 = load i8, ptr %i101, align 1, !tbaa !20
  %i103 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 3
  %i104 = load i8, ptr %i103, align 1, !tbaa !20
  %i105 = getelementptr inbounds i8, ptr %arg, i64 81
  %i106 = load i8, ptr %i105, align 1, !tbaa !20
  %i107 = getelementptr inbounds i8, ptr %arg, i64 82
  %i108 = load i8, ptr %i107, align 1, !tbaa !20
  %i109 = getelementptr inbounds i8, ptr %arg, i64 83
  %i110 = load i8, ptr %i109, align 1, !tbaa !20
  %i111 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 4
  %i112 = load i8, ptr %i111, align 1, !tbaa !20
  %i113 = getelementptr inbounds i8, ptr %arg, i64 89
  %i114 = load i8, ptr %i113, align 1, !tbaa !20
  %i115 = getelementptr inbounds i8, ptr %arg, i64 90
  %i116 = load i8, ptr %i115, align 1, !tbaa !20
  %i117 = getelementptr inbounds i8, ptr %arg, i64 91
  %i118 = load i8, ptr %i117, align 1, !tbaa !20
  %i119 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 5
  %i120 = load i8, ptr %i119, align 1, !tbaa !20
  %i121 = getelementptr inbounds i8, ptr %arg, i64 97
  %i122 = load i8, ptr %i121, align 1, !tbaa !20
  %i123 = getelementptr inbounds i8, ptr %arg, i64 98
  %i124 = load i8, ptr %i123, align 1, !tbaa !20
  %i125 = getelementptr inbounds i8, ptr %arg, i64 99
  %i126 = load i8, ptr %i125, align 1, !tbaa !20
  %i127 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 6
  %i128 = load i8, ptr %i127, align 1, !tbaa !20
  %i129 = getelementptr inbounds i8, ptr %arg, i64 105
  %i130 = load i8, ptr %i129, align 1, !tbaa !20
  %i131 = getelementptr inbounds i8, ptr %arg, i64 106
  %i132 = load i8, ptr %i131, align 1, !tbaa !20
  %i133 = getelementptr inbounds i8, ptr %arg, i64 107
  %i134 = load i8, ptr %i133, align 1, !tbaa !20
  br label %bb135

bb135:                                            ; preds = %bb80, %bb17
  %i136 = phi i8 [ %i134, %bb80 ], [ 0, %bb17 ]
  %i137 = phi i8 [ %i132, %bb80 ], [ 0, %bb17 ]
  %i138 = phi i8 [ %i130, %bb80 ], [ 0, %bb17 ]
  %i139 = phi i8 [ %i128, %bb80 ], [ 0, %bb17 ]
  %i140 = phi i8 [ %i126, %bb80 ], [ 0, %bb17 ]
  %i141 = phi i8 [ %i124, %bb80 ], [ 0, %bb17 ]
  %i142 = phi i8 [ %i122, %bb80 ], [ 0, %bb17 ]
  %i143 = phi i8 [ %i120, %bb80 ], [ 0, %bb17 ]
  %i144 = phi i8 [ %i118, %bb80 ], [ 0, %bb17 ]
  %i145 = phi i8 [ %i116, %bb80 ], [ 0, %bb17 ]
  %i146 = phi i8 [ %i114, %bb80 ], [ 0, %bb17 ]
  %i147 = phi i8 [ %i112, %bb80 ], [ 0, %bb17 ]
  %i148 = phi i8 [ %i110, %bb80 ], [ 0, %bb17 ]
  %i149 = phi i8 [ %i108, %bb80 ], [ 0, %bb17 ]
  %i150 = phi i8 [ %i106, %bb80 ], [ 0, %bb17 ]
  %i151 = phi i8 [ %i104, %bb80 ], [ 0, %bb17 ]
  %i152 = phi i8 [ %i102, %bb80 ], [ 0, %bb17 ]
  %i153 = phi i8 [ %i100, %bb80 ], [ 0, %bb17 ]
  %i154 = phi i8 [ %i98, %bb80 ], [ 0, %bb17 ]
  %i155 = phi i8 [ %i96, %bb80 ], [ 0, %bb17 ]
  %i156 = phi i8 [ %i94, %bb80 ], [ 0, %bb17 ]
  %i157 = phi i8 [ %i92, %bb80 ], [ 0, %bb17 ]
  %i158 = phi i8 [ %i90, %bb80 ], [ 0, %bb17 ]
  %i159 = phi i8 [ %i88, %bb80 ], [ 0, %bb17 ]
  %i160 = phi i8 [ %i86, %bb80 ], [ 0, %bb17 ]
  %i161 = phi i8 [ %i85, %bb80 ], [ 0, %bb17 ]
  %i162 = phi i8 [ %i84, %bb80 ], [ 0, %bb17 ]
  %i163 = phi i8 [ %i83, %bb80 ], [ 0, %bb17 ]
  %i164 = getelementptr inbounds i8, ptr %arg, i64 57
  %i165 = getelementptr inbounds i8, ptr %arg, i64 58
  %i166 = getelementptr inbounds i8, ptr %arg, i64 59
  store i8 %i160, ptr %i7, align 1, !tbaa !20
  store i8 %i161, ptr %i164, align 1, !tbaa !20
  store i8 %i162, ptr %i165, align 1, !tbaa !20
  store i8 %i163, ptr %i166, align 1, !tbaa !20
  %i167 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 1
  %i168 = getelementptr inbounds i8, ptr %arg, i64 65
  %i169 = getelementptr inbounds i8, ptr %arg, i64 66
  %i170 = getelementptr inbounds i8, ptr %arg, i64 67
  store i8 %i156, ptr %i167, align 1, !tbaa !20
  store i8 %i157, ptr %i168, align 1, !tbaa !20
  store i8 %i158, ptr %i169, align 1, !tbaa !20
  store i8 %i159, ptr %i170, align 1, !tbaa !20
  %i171 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 2
  %i172 = getelementptr inbounds i8, ptr %arg, i64 73
  %i173 = getelementptr inbounds i8, ptr %arg, i64 74
  %i174 = getelementptr inbounds i8, ptr %arg, i64 75
  store i8 %i152, ptr %i171, align 1, !tbaa !20
  store i8 %i153, ptr %i172, align 1, !tbaa !20
  store i8 %i154, ptr %i173, align 1, !tbaa !20
  store i8 %i155, ptr %i174, align 1, !tbaa !20
  %i175 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 3
  %i176 = getelementptr inbounds i8, ptr %arg, i64 81
  %i177 = getelementptr inbounds i8, ptr %arg, i64 82
  %i178 = getelementptr inbounds i8, ptr %arg, i64 83
  store i8 %i148, ptr %i175, align 1, !tbaa !20
  store i8 %i149, ptr %i176, align 1, !tbaa !20
  store i8 %i150, ptr %i177, align 1, !tbaa !20
  store i8 %i151, ptr %i178, align 1, !tbaa !20
  %i179 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 4
  %i180 = getelementptr inbounds i8, ptr %arg, i64 89
  %i181 = getelementptr inbounds i8, ptr %arg, i64 90
  %i182 = getelementptr inbounds i8, ptr %arg, i64 91
  store i8 %i144, ptr %i179, align 1, !tbaa !20
  store i8 %i145, ptr %i180, align 1, !tbaa !20
  store i8 %i146, ptr %i181, align 1, !tbaa !20
  store i8 %i147, ptr %i182, align 1, !tbaa !20
  %i183 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 5
  %i184 = getelementptr inbounds i8, ptr %arg, i64 97
  %i185 = getelementptr inbounds i8, ptr %arg, i64 98
  %i186 = getelementptr inbounds i8, ptr %arg, i64 99
  store i8 %i140, ptr %i183, align 1, !tbaa !20
  store i8 %i141, ptr %i184, align 1, !tbaa !20
  store i8 %i142, ptr %i185, align 1, !tbaa !20
  store i8 %i143, ptr %i186, align 1, !tbaa !20
  %i187 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 6
  %i188 = getelementptr inbounds i8, ptr %arg, i64 105
  %i189 = getelementptr inbounds i8, ptr %arg, i64 106
  %i190 = getelementptr inbounds i8, ptr %arg, i64 107
  store i8 %i136, ptr %i187, align 1, !tbaa !20
  store i8 %i137, ptr %i188, align 1, !tbaa !20
  store i8 %i138, ptr %i189, align 1, !tbaa !20
  store i8 %i139, ptr %i190, align 1, !tbaa !20
  %i191 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 7
  %i192 = load i8, ptr %i191, align 1, !tbaa !20
  %i193 = getelementptr inbounds i8, ptr %arg, i64 113
  %i194 = load i8, ptr %i193, align 1, !tbaa !20
  %i195 = getelementptr inbounds i8, ptr %arg, i64 114
  %i196 = load i8, ptr %i195, align 1, !tbaa !20
  %i197 = getelementptr inbounds i8, ptr %arg, i64 115
  %i198 = load i8, ptr %i197, align 1, !tbaa !20
  store i8 %i198, ptr %i191, align 1, !tbaa !20
  store i8 %i196, ptr %i193, align 1, !tbaa !20
  store i8 %i194, ptr %i195, align 1, !tbaa !20
  store i8 %i192, ptr %i197, align 1, !tbaa !20
  %i199 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 14
  store i64 %i3, ptr %i199, align 8, !tbaa !12
  %i200 = getelementptr inbounds %struct.SHA_INFO, ptr %arg, i64 0, i32 3, i64 15
  store i64 %i1, ptr %i200, align 8, !tbaa !12
  tail call fastcc void @sha_transform(ptr noundef nonnull %arg)
  ret void
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @sha_stream(ptr noundef %arg, ptr nocapture noundef %arg1) local_unnamed_addr #11 {
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
  br label %bb7

bb7:                                              ; preds = %bb11, %bb
  %i8 = call i64 @fread(ptr noundef nonnull %i, i64 noundef 1, i64 noundef 8192, ptr noundef %arg1)
  %i9 = trunc i64 %i8 to i32
  %i10 = icmp sgt i32 %i9, 0
  br i1 %i10, label %bb11, label %bb12

bb11:                                             ; preds = %bb7
  call void @sha_update(ptr noundef nonnull %arg, ptr noundef nonnull %i, i32 noundef %i9)
  br label %bb7, !llvm.loop !27

bb12:                                             ; preds = %bb7
  tail call void @sha_final(ptr noundef nonnull %arg)
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
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = !{!18, !13, i64 40}
!18 = !{!"", !10, i64 0, !13, i64 40, !13, i64 48, !10, i64 56}
!19 = !{!18, !13, i64 48}
!20 = !{!10, !10, i64 0}
!21 = distinct !{!21, !15}
!22 = distinct !{!22, !15}
!23 = distinct !{!23, !15}
!24 = distinct !{!24, !15}
!25 = distinct !{!25, !15}
!26 = distinct !{!26, !15}
!27 = distinct !{!27, !15}
