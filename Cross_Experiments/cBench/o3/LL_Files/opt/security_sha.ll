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

bb21:                                             ; preds = %bb7.bb21_crit_edge, %bb21.loopexit, %bb4
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
  br i1 %i3, label %bb18, label %bb4

bb4:                                              ; preds = %bb
  %i5 = add nsw i32 %arg, -1
  %i6 = icmp eq i32 %arg2, 0
  br i1 %i6, label %bb7.preheader, label %bb22.preheader

bb22.preheader:                                   ; preds = %bb4
  br label %bb22

bb7.preheader:                                    ; preds = %bb4
  br label %bb7

bb7:                                              ; preds = %bb14.bb7_crit_edge, %bb7.preheader
  %i8 = phi i32 [ %i16, %bb14.bb7_crit_edge ], [ %i5, %bb7.preheader ]
  %i9 = phi ptr [ %i10, %bb14.bb7_crit_edge ], [ %arg1, %bb7.preheader ]
  %i10 = getelementptr inbounds ptr, ptr %i9, i64 1
  %i11 = load ptr, ptr %i10, align 8, !tbaa !8
  %i12 = call noalias ptr @fopen(ptr noundef %i11, ptr noundef nonnull @.str.4)
  %i13 = icmp eq ptr %i12, null
  br i1 %i13, label %bb29.loopexit, label %bb14

bb14:                                             ; preds = %bb7
  call void @sha_stream(ptr noundef nonnull %i, ptr noundef nonnull %i12) #12
  %i15 = call i32 @fclose(ptr noundef nonnull %i12)
  %i16 = add nsw i32 %i8, -1
  %i17 = icmp eq i32 %i16, 0
  br i1 %i17, label %bb38.loopexit, label %bb14.bb7_crit_edge, !llvm.loop !16

bb14.bb7_crit_edge:                               ; preds = %bb14
  br label %bb7

bb18:                                             ; preds = %bb
  %i19 = load ptr, ptr @stdin, align 8, !tbaa !8
  call void @sha_stream(ptr noundef nonnull %i, ptr noundef %i19) #12
  %i20 = icmp eq i32 %arg2, 0
  br i1 %i20, label %bb18.bb38_crit_edge, label %bb21

bb18.bb38_crit_edge:                              ; preds = %bb18
  br label %bb38

bb21:                                             ; preds = %bb18
  call void @sha_print(ptr noundef nonnull %i) #12
  br label %bb38

bb22:                                             ; preds = %bb34.bb22_crit_edge, %bb22.preheader
  %i23 = phi i32 [ %i36, %bb34.bb22_crit_edge ], [ %i5, %bb22.preheader ]
  %i24 = phi ptr [ %i25, %bb34.bb22_crit_edge ], [ %arg1, %bb22.preheader ]
  %i25 = getelementptr inbounds ptr, ptr %i24, i64 1
  %i26 = load ptr, ptr %i25, align 8, !tbaa !8
  %i27 = call noalias ptr @fopen(ptr noundef %i26, ptr noundef nonnull @.str.4)
  %i28 = icmp eq ptr %i27, null
  br i1 %i28, label %bb29.loopexit1, label %bb34

bb29.loopexit:                                    ; preds = %bb7
  br label %bb29

bb29.loopexit1:                                   ; preds = %bb22
  br label %bb29

bb29:                                             ; preds = %bb29.loopexit1, %bb29.loopexit
  %i30 = phi ptr [ %i10, %bb29.loopexit ], [ %i25, %bb29.loopexit1 ]
  %i31 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i32 = load ptr, ptr %i30, align 8, !tbaa !8
  %i33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i31, ptr noundef nonnull @.str.1.5, ptr noundef %i32) #13
  call void @exit(i32 noundef 1) #14
  unreachable

bb34:                                             ; preds = %bb22
  call void @sha_stream(ptr noundef nonnull %i, ptr noundef nonnull %i27) #12
  call void @sha_print(ptr noundef nonnull %i) #12
  %i35 = call i32 @fclose(ptr noundef nonnull %i27)
  %i36 = add nsw i32 %i23, -1
  %i37 = icmp eq i32 %i36, 0
  br i1 %i37, label %bb38.loopexit2, label %bb34.bb22_crit_edge, !llvm.loop !16

bb34.bb22_crit_edge:                              ; preds = %bb34
  br label %bb22

bb38.loopexit:                                    ; preds = %bb14
  br label %bb38

bb38.loopexit2:                                   ; preds = %bb34
  br label %bb38

bb38:                                             ; preds = %bb18.bb38_crit_edge, %bb38.loopexit2, %bb38.loopexit, %bb21
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

bb90:                                             ; preds = %bb.bb90_crit_edge, %bb88
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
  br i1 %i56, label %bb57, label %bb32.bb32_crit_edge, !llvm.loop !23

bb32.bb32_crit_edge:                              ; preds = %bb32
  br label %bb32

bb57:                                             ; preds = %bb32
  %i58 = shl i64 %i51, 5
  %i59 = lshr i64 %i51, 27
  %i60 = or i64 %i58, %i59
  %i61 = xor i64 %i54, %i38
  %i62 = xor i64 %i61, %i36
  %i63 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 20
  %i64 = load i64, ptr %i63, align 16, !tbaa !12
  %i65 = add i64 %i60, 1859775393
  %i66 = add i64 %i65, %i62
  %i67 = add i64 %i66, %i35
  %i68 = add i64 %i67, %i64
  %i69 = shl i64 %i38, 30
  %i70 = lshr i64 %i38, 2
  %i71 = or i64 %i69, %i70
  %i72 = shl i64 %i68, 5
  %i73 = lshr i64 %i68, 27
  %i74 = or i64 %i72, %i73
  %i75 = xor i64 %i71, %i51
  %i76 = xor i64 %i75, %i54
  %i77 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 21
  %i78 = load i64, ptr %i77, align 8, !tbaa !12
  %i79 = add i64 %i74, 1859775393
  %i80 = add i64 %i79, %i76
  %i81 = add i64 %i80, %i36
  %i82 = add i64 %i81, %i78
  %i83 = shl i64 %i51, 30
  %i84 = lshr i64 %i51, 2
  %i85 = or i64 %i83, %i84
  %i86 = shl i64 %i82, 5
  %i87 = lshr i64 %i82, 27
  %i88 = or i64 %i86, %i87
  %i89 = xor i64 %i85, %i68
  %i90 = xor i64 %i89, %i71
  %i91 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 22
  %i92 = load i64, ptr %i91, align 16, !tbaa !12
  %i93 = add i64 %i88, 1859775393
  %i94 = add i64 %i93, %i90
  %i95 = add i64 %i94, %i54
  %i96 = add i64 %i95, %i92
  %i97 = shl i64 %i68, 30
  %i98 = lshr i64 %i68, 2
  %i99 = or i64 %i97, %i98
  %i100 = shl i64 %i96, 5
  %i101 = lshr i64 %i96, 27
  %i102 = or i64 %i100, %i101
  %i103 = xor i64 %i99, %i82
  %i104 = xor i64 %i103, %i85
  %i105 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 23
  %i106 = load i64, ptr %i105, align 8, !tbaa !12
  %i107 = add i64 %i102, 1859775393
  %i108 = add i64 %i107, %i104
  %i109 = add i64 %i108, %i71
  %i110 = add i64 %i109, %i106
  %i111 = shl i64 %i82, 30
  %i112 = lshr i64 %i82, 2
  %i113 = or i64 %i111, %i112
  %i114 = shl i64 %i110, 5
  %i115 = lshr i64 %i110, 27
  %i116 = or i64 %i114, %i115
  %i117 = xor i64 %i113, %i96
  %i118 = xor i64 %i117, %i99
  %i119 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 24
  %i120 = load i64, ptr %i119, align 16, !tbaa !12
  %i121 = add i64 %i116, 1859775393
  %i122 = add i64 %i121, %i118
  %i123 = add i64 %i122, %i85
  %i124 = add i64 %i123, %i120
  %i125 = shl i64 %i96, 30
  %i126 = lshr i64 %i96, 2
  %i127 = or i64 %i125, %i126
  %i128 = shl i64 %i124, 5
  %i129 = lshr i64 %i124, 27
  %i130 = or i64 %i128, %i129
  %i131 = xor i64 %i127, %i110
  %i132 = xor i64 %i131, %i113
  %i133 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 25
  %i134 = load i64, ptr %i133, align 8, !tbaa !12
  %i135 = add i64 %i130, 1859775393
  %i136 = add i64 %i135, %i132
  %i137 = add i64 %i136, %i99
  %i138 = add i64 %i137, %i134
  %i139 = shl i64 %i110, 30
  %i140 = lshr i64 %i110, 2
  %i141 = or i64 %i139, %i140
  %i142 = shl i64 %i138, 5
  %i143 = lshr i64 %i138, 27
  %i144 = or i64 %i142, %i143
  %i145 = xor i64 %i141, %i124
  %i146 = xor i64 %i145, %i127
  %i147 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 26
  %i148 = load i64, ptr %i147, align 16, !tbaa !12
  %i149 = add i64 %i144, 1859775393
  %i150 = add i64 %i149, %i146
  %i151 = add i64 %i150, %i113
  %i152 = add i64 %i151, %i148
  %i153 = shl i64 %i124, 30
  %i154 = lshr i64 %i124, 2
  %i155 = or i64 %i153, %i154
  %i156 = shl i64 %i152, 5
  %i157 = lshr i64 %i152, 27
  %i158 = or i64 %i156, %i157
  %i159 = xor i64 %i155, %i138
  %i160 = xor i64 %i159, %i141
  %i161 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 27
  %i162 = load i64, ptr %i161, align 8, !tbaa !12
  %i163 = add i64 %i158, 1859775393
  %i164 = add i64 %i163, %i160
  %i165 = add i64 %i164, %i127
  %i166 = add i64 %i165, %i162
  %i167 = shl i64 %i138, 30
  %i168 = lshr i64 %i138, 2
  %i169 = or i64 %i167, %i168
  %i170 = shl i64 %i166, 5
  %i171 = lshr i64 %i166, 27
  %i172 = or i64 %i170, %i171
  %i173 = xor i64 %i169, %i152
  %i174 = xor i64 %i173, %i155
  %i175 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 28
  %i176 = load i64, ptr %i175, align 16, !tbaa !12
  %i177 = add i64 %i172, 1859775393
  %i178 = add i64 %i177, %i174
  %i179 = add i64 %i178, %i141
  %i180 = add i64 %i179, %i176
  %i181 = shl i64 %i152, 30
  %i182 = lshr i64 %i152, 2
  %i183 = or i64 %i181, %i182
  %i184 = shl i64 %i180, 5
  %i185 = lshr i64 %i180, 27
  %i186 = or i64 %i184, %i185
  %i187 = xor i64 %i183, %i166
  %i188 = xor i64 %i187, %i169
  %i189 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 29
  %i190 = load i64, ptr %i189, align 8, !tbaa !12
  %i191 = add i64 %i186, 1859775393
  %i192 = add i64 %i191, %i188
  %i193 = add i64 %i192, %i155
  %i194 = add i64 %i193, %i190
  %i195 = shl i64 %i166, 30
  %i196 = lshr i64 %i166, 2
  %i197 = or i64 %i195, %i196
  %i198 = shl i64 %i194, 5
  %i199 = lshr i64 %i194, 27
  %i200 = or i64 %i198, %i199
  %i201 = xor i64 %i197, %i180
  %i202 = xor i64 %i201, %i183
  %i203 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 30
  %i204 = load i64, ptr %i203, align 16, !tbaa !12
  %i205 = add i64 %i200, 1859775393
  %i206 = add i64 %i205, %i202
  %i207 = add i64 %i206, %i169
  %i208 = add i64 %i207, %i204
  %i209 = shl i64 %i180, 30
  %i210 = lshr i64 %i180, 2
  %i211 = or i64 %i209, %i210
  %i212 = shl i64 %i208, 5
  %i213 = lshr i64 %i208, 27
  %i214 = or i64 %i212, %i213
  %i215 = xor i64 %i211, %i194
  %i216 = xor i64 %i215, %i197
  %i217 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 31
  %i218 = load i64, ptr %i217, align 8, !tbaa !12
  %i219 = add i64 %i214, 1859775393
  %i220 = add i64 %i219, %i216
  %i221 = add i64 %i220, %i183
  %i222 = add i64 %i221, %i218
  %i223 = shl i64 %i194, 30
  %i224 = lshr i64 %i194, 2
  %i225 = or i64 %i223, %i224
  %i226 = shl i64 %i222, 5
  %i227 = lshr i64 %i222, 27
  %i228 = or i64 %i226, %i227
  %i229 = xor i64 %i225, %i208
  %i230 = xor i64 %i229, %i211
  %i231 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 32
  %i232 = load i64, ptr %i231, align 16, !tbaa !12
  %i233 = add i64 %i228, 1859775393
  %i234 = add i64 %i233, %i230
  %i235 = add i64 %i234, %i197
  %i236 = add i64 %i235, %i232
  %i237 = shl i64 %i208, 30
  %i238 = lshr i64 %i208, 2
  %i239 = or i64 %i237, %i238
  %i240 = shl i64 %i236, 5
  %i241 = lshr i64 %i236, 27
  %i242 = or i64 %i240, %i241
  %i243 = xor i64 %i239, %i222
  %i244 = xor i64 %i243, %i225
  %i245 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 33
  %i246 = load i64, ptr %i245, align 8, !tbaa !12
  %i247 = add i64 %i242, 1859775393
  %i248 = add i64 %i247, %i244
  %i249 = add i64 %i248, %i211
  %i250 = add i64 %i249, %i246
  %i251 = shl i64 %i222, 30
  %i252 = lshr i64 %i222, 2
  %i253 = or i64 %i251, %i252
  %i254 = shl i64 %i250, 5
  %i255 = lshr i64 %i250, 27
  %i256 = or i64 %i254, %i255
  %i257 = xor i64 %i253, %i236
  %i258 = xor i64 %i257, %i239
  %i259 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 34
  %i260 = load i64, ptr %i259, align 16, !tbaa !12
  %i261 = add i64 %i256, 1859775393
  %i262 = add i64 %i261, %i258
  %i263 = add i64 %i262, %i225
  %i264 = add i64 %i263, %i260
  %i265 = shl i64 %i236, 30
  %i266 = lshr i64 %i236, 2
  %i267 = or i64 %i265, %i266
  %i268 = shl i64 %i264, 5
  %i269 = lshr i64 %i264, 27
  %i270 = or i64 %i268, %i269
  %i271 = xor i64 %i267, %i250
  %i272 = xor i64 %i271, %i253
  %i273 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 35
  %i274 = load i64, ptr %i273, align 8, !tbaa !12
  %i275 = add i64 %i270, 1859775393
  %i276 = add i64 %i275, %i272
  %i277 = add i64 %i276, %i239
  %i278 = add i64 %i277, %i274
  %i279 = shl i64 %i250, 30
  %i280 = lshr i64 %i250, 2
  %i281 = or i64 %i279, %i280
  %i282 = shl i64 %i278, 5
  %i283 = lshr i64 %i278, 27
  %i284 = or i64 %i282, %i283
  %i285 = xor i64 %i281, %i264
  %i286 = xor i64 %i285, %i267
  %i287 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 36
  %i288 = load i64, ptr %i287, align 16, !tbaa !12
  %i289 = add i64 %i284, 1859775393
  %i290 = add i64 %i289, %i286
  %i291 = add i64 %i290, %i253
  %i292 = add i64 %i291, %i288
  %i293 = shl i64 %i264, 30
  %i294 = lshr i64 %i264, 2
  %i295 = or i64 %i293, %i294
  %i296 = shl i64 %i292, 5
  %i297 = lshr i64 %i292, 27
  %i298 = or i64 %i296, %i297
  %i299 = xor i64 %i295, %i278
  %i300 = xor i64 %i299, %i281
  %i301 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 37
  %i302 = load i64, ptr %i301, align 8, !tbaa !12
  %i303 = add i64 %i298, 1859775393
  %i304 = add i64 %i303, %i300
  %i305 = add i64 %i304, %i267
  %i306 = add i64 %i305, %i302
  %i307 = shl i64 %i278, 30
  %i308 = lshr i64 %i278, 2
  %i309 = or i64 %i307, %i308
  %i310 = shl i64 %i306, 5
  %i311 = lshr i64 %i306, 27
  %i312 = or i64 %i310, %i311
  %i313 = xor i64 %i309, %i292
  %i314 = xor i64 %i313, %i295
  %i315 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 38
  %i316 = load i64, ptr %i315, align 16, !tbaa !12
  %i317 = add i64 %i312, 1859775393
  %i318 = add i64 %i317, %i314
  %i319 = add i64 %i318, %i281
  %i320 = add i64 %i319, %i316
  %i321 = shl i64 %i292, 30
  %i322 = lshr i64 %i292, 2
  %i323 = or i64 %i321, %i322
  %i324 = shl i64 %i320, 5
  %i325 = lshr i64 %i320, 27
  %i326 = or i64 %i324, %i325
  %i327 = xor i64 %i323, %i306
  %i328 = xor i64 %i327, %i309
  %i329 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 39
  %i330 = load i64, ptr %i329, align 8, !tbaa !12
  %i331 = add i64 %i326, 1859775393
  %i332 = add i64 %i331, %i328
  %i333 = add i64 %i332, %i295
  %i334 = add i64 %i333, %i330
  %i335 = shl i64 %i306, 30
  %i336 = lshr i64 %i306, 2
  %i337 = or i64 %i335, %i336
  br label %bb338

bb338:                                            ; preds = %bb338.bb338_crit_edge, %bb57
  %i339 = phi i64 [ 40, %bb57 ], [ %i361, %bb338.bb338_crit_edge ]
  %i340 = phi i64 [ %i309, %bb57 ], [ %i341, %bb338.bb338_crit_edge ]
  %i341 = phi i64 [ %i323, %bb57 ], [ %i342, %bb338.bb338_crit_edge ]
  %i342 = phi i64 [ %i337, %bb57 ], [ %i360, %bb338.bb338_crit_edge ]
  %i343 = phi i64 [ %i320, %bb57 ], [ %i344, %bb338.bb338_crit_edge ]
  %i344 = phi i64 [ %i334, %bb57 ], [ %i357, %bb338.bb338_crit_edge ]
  %i345 = shl i64 %i344, 5
  %i346 = lshr i64 %i344, 27
  %i347 = or i64 %i345, %i346
  %i348 = or i64 %i341, %i342
  %i349 = and i64 %i348, %i343
  %i350 = and i64 %i341, %i342
  %i351 = or i64 %i349, %i350
  %i352 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 %i339
  %i353 = load i64, ptr %i352, align 8, !tbaa !12
  %i354 = add i64 %i347, 2400959708
  %i355 = add i64 %i354, %i340
  %i356 = add i64 %i355, %i351
  %i357 = add i64 %i356, %i353
  %i358 = shl i64 %i343, 30
  %i359 = lshr i64 %i343, 2
  %i360 = or i64 %i358, %i359
  %i361 = add nuw nsw i64 %i339, 1
  %i362 = icmp eq i64 %i361, 60
  br i1 %i362, label %bb363, label %bb338.bb338_crit_edge, !llvm.loop !24

bb338.bb338_crit_edge:                            ; preds = %bb338
  br label %bb338

bb363:                                            ; preds = %bb338
  %i364 = shl i64 %i357, 5
  %i365 = lshr i64 %i357, 27
  %i366 = or i64 %i364, %i365
  %i367 = xor i64 %i360, %i344
  %i368 = xor i64 %i367, %i342
  %i369 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 60
  %i370 = load i64, ptr %i369, align 16, !tbaa !12
  %i371 = add i64 %i366, 3395469782
  %i372 = add i64 %i371, %i368
  %i373 = add i64 %i372, %i341
  %i374 = add i64 %i373, %i370
  %i375 = shl i64 %i344, 30
  %i376 = lshr i64 %i344, 2
  %i377 = or i64 %i375, %i376
  %i378 = shl i64 %i374, 5
  %i379 = lshr i64 %i374, 27
  %i380 = or i64 %i378, %i379
  %i381 = xor i64 %i377, %i357
  %i382 = xor i64 %i381, %i360
  %i383 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 61
  %i384 = load i64, ptr %i383, align 8, !tbaa !12
  %i385 = add i64 %i380, 3395469782
  %i386 = add i64 %i385, %i382
  %i387 = add i64 %i386, %i342
  %i388 = add i64 %i387, %i384
  %i389 = shl i64 %i357, 30
  %i390 = lshr i64 %i357, 2
  %i391 = or i64 %i389, %i390
  %i392 = shl i64 %i388, 5
  %i393 = lshr i64 %i388, 27
  %i394 = or i64 %i392, %i393
  %i395 = xor i64 %i391, %i374
  %i396 = xor i64 %i395, %i377
  %i397 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 62
  %i398 = load i64, ptr %i397, align 16, !tbaa !12
  %i399 = add i64 %i394, 3395469782
  %i400 = add i64 %i399, %i396
  %i401 = add i64 %i400, %i360
  %i402 = add i64 %i401, %i398
  %i403 = shl i64 %i374, 30
  %i404 = lshr i64 %i374, 2
  %i405 = or i64 %i403, %i404
  %i406 = shl i64 %i402, 5
  %i407 = lshr i64 %i402, 27
  %i408 = or i64 %i406, %i407
  %i409 = xor i64 %i405, %i388
  %i410 = xor i64 %i409, %i391
  %i411 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 63
  %i412 = load i64, ptr %i411, align 8, !tbaa !12
  %i413 = add i64 %i408, 3395469782
  %i414 = add i64 %i413, %i410
  %i415 = add i64 %i414, %i377
  %i416 = add i64 %i415, %i412
  %i417 = shl i64 %i388, 30
  %i418 = lshr i64 %i388, 2
  %i419 = or i64 %i417, %i418
  %i420 = shl i64 %i416, 5
  %i421 = lshr i64 %i416, 27
  %i422 = or i64 %i420, %i421
  %i423 = xor i64 %i419, %i402
  %i424 = xor i64 %i423, %i405
  %i425 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 64
  %i426 = load i64, ptr %i425, align 16, !tbaa !12
  %i427 = add i64 %i422, 3395469782
  %i428 = add i64 %i427, %i424
  %i429 = add i64 %i428, %i391
  %i430 = add i64 %i429, %i426
  %i431 = shl i64 %i402, 30
  %i432 = lshr i64 %i402, 2
  %i433 = or i64 %i431, %i432
  %i434 = shl i64 %i430, 5
  %i435 = lshr i64 %i430, 27
  %i436 = or i64 %i434, %i435
  %i437 = xor i64 %i433, %i416
  %i438 = xor i64 %i437, %i419
  %i439 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 65
  %i440 = load i64, ptr %i439, align 8, !tbaa !12
  %i441 = add i64 %i436, 3395469782
  %i442 = add i64 %i441, %i438
  %i443 = add i64 %i442, %i405
  %i444 = add i64 %i443, %i440
  %i445 = shl i64 %i416, 30
  %i446 = lshr i64 %i416, 2
  %i447 = or i64 %i445, %i446
  %i448 = shl i64 %i444, 5
  %i449 = lshr i64 %i444, 27
  %i450 = or i64 %i448, %i449
  %i451 = xor i64 %i447, %i430
  %i452 = xor i64 %i451, %i433
  %i453 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 66
  %i454 = load i64, ptr %i453, align 16, !tbaa !12
  %i455 = add i64 %i450, 3395469782
  %i456 = add i64 %i455, %i452
  %i457 = add i64 %i456, %i419
  %i458 = add i64 %i457, %i454
  %i459 = shl i64 %i430, 30
  %i460 = lshr i64 %i430, 2
  %i461 = or i64 %i459, %i460
  %i462 = shl i64 %i458, 5
  %i463 = lshr i64 %i458, 27
  %i464 = or i64 %i462, %i463
  %i465 = xor i64 %i461, %i444
  %i466 = xor i64 %i465, %i447
  %i467 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 67
  %i468 = load i64, ptr %i467, align 8, !tbaa !12
  %i469 = add i64 %i464, 3395469782
  %i470 = add i64 %i469, %i466
  %i471 = add i64 %i470, %i433
  %i472 = add i64 %i471, %i468
  %i473 = shl i64 %i444, 30
  %i474 = lshr i64 %i444, 2
  %i475 = or i64 %i473, %i474
  %i476 = shl i64 %i472, 5
  %i477 = lshr i64 %i472, 27
  %i478 = or i64 %i476, %i477
  %i479 = xor i64 %i475, %i458
  %i480 = xor i64 %i479, %i461
  %i481 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 68
  %i482 = load i64, ptr %i481, align 16, !tbaa !12
  %i483 = add i64 %i478, 3395469782
  %i484 = add i64 %i483, %i480
  %i485 = add i64 %i484, %i447
  %i486 = add i64 %i485, %i482
  %i487 = shl i64 %i458, 30
  %i488 = lshr i64 %i458, 2
  %i489 = or i64 %i487, %i488
  %i490 = shl i64 %i486, 5
  %i491 = lshr i64 %i486, 27
  %i492 = or i64 %i490, %i491
  %i493 = xor i64 %i489, %i472
  %i494 = xor i64 %i493, %i475
  %i495 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 69
  %i496 = load i64, ptr %i495, align 8, !tbaa !12
  %i497 = add i64 %i492, 3395469782
  %i498 = add i64 %i497, %i494
  %i499 = add i64 %i498, %i461
  %i500 = add i64 %i499, %i496
  %i501 = shl i64 %i472, 30
  %i502 = lshr i64 %i472, 2
  %i503 = or i64 %i501, %i502
  %i504 = shl i64 %i500, 5
  %i505 = lshr i64 %i500, 27
  %i506 = or i64 %i504, %i505
  %i507 = xor i64 %i503, %i486
  %i508 = xor i64 %i507, %i489
  %i509 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 70
  %i510 = load i64, ptr %i509, align 16, !tbaa !12
  %i511 = add i64 %i506, 3395469782
  %i512 = add i64 %i511, %i508
  %i513 = add i64 %i512, %i475
  %i514 = add i64 %i513, %i510
  %i515 = shl i64 %i486, 30
  %i516 = lshr i64 %i486, 2
  %i517 = or i64 %i515, %i516
  %i518 = shl i64 %i514, 5
  %i519 = lshr i64 %i514, 27
  %i520 = or i64 %i518, %i519
  %i521 = xor i64 %i517, %i500
  %i522 = xor i64 %i521, %i503
  %i523 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 71
  %i524 = load i64, ptr %i523, align 8, !tbaa !12
  %i525 = add i64 %i520, 3395469782
  %i526 = add i64 %i525, %i522
  %i527 = add i64 %i526, %i489
  %i528 = add i64 %i527, %i524
  %i529 = shl i64 %i500, 30
  %i530 = lshr i64 %i500, 2
  %i531 = or i64 %i529, %i530
  %i532 = shl i64 %i528, 5
  %i533 = lshr i64 %i528, 27
  %i534 = or i64 %i532, %i533
  %i535 = xor i64 %i531, %i514
  %i536 = xor i64 %i535, %i517
  %i537 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 72
  %i538 = load i64, ptr %i537, align 16, !tbaa !12
  %i539 = add i64 %i534, 3395469782
  %i540 = add i64 %i539, %i536
  %i541 = add i64 %i540, %i503
  %i542 = add i64 %i541, %i538
  %i543 = shl i64 %i514, 30
  %i544 = lshr i64 %i514, 2
  %i545 = or i64 %i543, %i544
  %i546 = shl i64 %i542, 5
  %i547 = lshr i64 %i542, 27
  %i548 = or i64 %i546, %i547
  %i549 = xor i64 %i545, %i528
  %i550 = xor i64 %i549, %i531
  %i551 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 73
  %i552 = load i64, ptr %i551, align 8, !tbaa !12
  %i553 = add i64 %i548, 3395469782
  %i554 = add i64 %i553, %i550
  %i555 = add i64 %i554, %i517
  %i556 = add i64 %i555, %i552
  %i557 = shl i64 %i528, 30
  %i558 = lshr i64 %i528, 2
  %i559 = or i64 %i557, %i558
  %i560 = shl i64 %i556, 5
  %i561 = lshr i64 %i556, 27
  %i562 = or i64 %i560, %i561
  %i563 = xor i64 %i559, %i542
  %i564 = xor i64 %i563, %i545
  %i565 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 74
  %i566 = load i64, ptr %i565, align 16, !tbaa !12
  %i567 = add i64 %i562, 3395469782
  %i568 = add i64 %i567, %i564
  %i569 = add i64 %i568, %i531
  %i570 = add i64 %i569, %i566
  %i571 = shl i64 %i542, 30
  %i572 = lshr i64 %i542, 2
  %i573 = or i64 %i571, %i572
  %i574 = shl i64 %i570, 5
  %i575 = lshr i64 %i570, 27
  %i576 = or i64 %i574, %i575
  %i577 = xor i64 %i573, %i556
  %i578 = xor i64 %i577, %i559
  %i579 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 75
  %i580 = load i64, ptr %i579, align 8, !tbaa !12
  %i581 = add i64 %i576, 3395469782
  %i582 = add i64 %i581, %i578
  %i583 = add i64 %i582, %i545
  %i584 = add i64 %i583, %i580
  %i585 = shl i64 %i556, 30
  %i586 = lshr i64 %i556, 2
  %i587 = or i64 %i585, %i586
  %i588 = shl i64 %i584, 5
  %i589 = lshr i64 %i584, 27
  %i590 = or i64 %i588, %i589
  %i591 = xor i64 %i587, %i570
  %i592 = xor i64 %i591, %i573
  %i593 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 76
  %i594 = load i64, ptr %i593, align 16, !tbaa !12
  %i595 = add i64 %i590, 3395469782
  %i596 = add i64 %i595, %i592
  %i597 = add i64 %i596, %i559
  %i598 = add i64 %i597, %i594
  %i599 = shl i64 %i570, 30
  %i600 = lshr i64 %i570, 2
  %i601 = or i64 %i599, %i600
  %i602 = shl i64 %i598, 5
  %i603 = lshr i64 %i598, 27
  %i604 = or i64 %i602, %i603
  %i605 = xor i64 %i601, %i584
  %i606 = xor i64 %i605, %i587
  %i607 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 77
  %i608 = load i64, ptr %i607, align 8, !tbaa !12
  %i609 = add i64 %i604, 3395469782
  %i610 = add i64 %i609, %i606
  %i611 = add i64 %i610, %i573
  %i612 = add i64 %i611, %i608
  %i613 = shl i64 %i584, 30
  %i614 = lshr i64 %i584, 2
  %i615 = or i64 %i613, %i614
  %i616 = shl i64 %i612, 5
  %i617 = lshr i64 %i612, 27
  %i618 = or i64 %i616, %i617
  %i619 = xor i64 %i615, %i598
  %i620 = xor i64 %i619, %i601
  %i621 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 78
  %i622 = load i64, ptr %i621, align 16, !tbaa !12
  %i623 = add i64 %i618, 3395469782
  %i624 = add i64 %i623, %i620
  %i625 = add i64 %i624, %i587
  %i626 = add i64 %i625, %i622
  %i627 = shl i64 %i598, 30
  %i628 = lshr i64 %i598, 2
  %i629 = or i64 %i627, %i628
  %i630 = shl i64 %i626, 5
  %i631 = lshr i64 %i626, 27
  %i632 = or i64 %i630, %i631
  %i633 = xor i64 %i629, %i612
  %i634 = xor i64 %i633, %i615
  %i635 = getelementptr inbounds [80 x i64], ptr %i, i64 0, i64 79
  %i636 = load i64, ptr %i635, align 8, !tbaa !12
  %i637 = add i64 %i632, 3395469782
  %i638 = add i64 %i637, %i634
  %i639 = add i64 %i638, %i601
  %i640 = add i64 %i639, %i636
  %i641 = shl i64 %i612, 30
  %i642 = lshr i64 %i612, 2
  %i643 = or i64 %i641, %i642
  %i644 = add i64 %i640, %i23
  store i64 %i644, ptr %arg, align 8, !tbaa !12
  %i645 = add i64 %i626, %i25
  store i64 %i645, ptr %i24, align 8, !tbaa !12
  %i646 = add i64 %i643, %i27
  store i64 %i646, ptr %i26, align 8, !tbaa !12
  %i647 = add i64 %i629, %i29
  store i64 %i647, ptr %i28, align 8, !tbaa !12
  %i648 = add i64 %i615, %i31
  store i64 %i648, ptr %i30, align 8, !tbaa !12
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
  br label %bb7, !llvm.loop !25

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
