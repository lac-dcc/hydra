; ModuleID = 'office_stringsearch1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@lowervec = dso_local local_unnamed_addr global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\7Fcueaaaaceeeiiiaae\91\92ooouuyou\9B\9C\9D\9E\9Faiounn\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 16
@pat = internal unnamed_addr global ptr null, align 8
@patlen = internal unnamed_addr global i32 0, align 4
@skip = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@skip2 = internal unnamed_addr global i32 0, align 4
@patlen.1 = internal unnamed_addr global i32 0, align 4
@pat.2 = internal unnamed_addr global ptr null, align 8
@skip.3 = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@skip2.4 = internal unnamed_addr global i32 0, align 4
@pat.5 = internal unnamed_addr global ptr null, align 8
@patlen.6 = internal unnamed_addr global i32 0, align 4
@skip.7 = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@skip2.8 = internal unnamed_addr global i32 0, align 4
@len = internal unnamed_addr global i64 0, align 8
@table = internal unnamed_addr global [256 x i64] zeroinitializer, align 16
@findme = internal unnamed_addr global ptr null, align 8
@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Error: too few parameters!\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"\0AError: Can't find text!\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"\0AError: Can't find search strings!\0A\00", align 1
@str_misc = internal global [1024 x i8] zeroinitializer, align 16
@.str.7 = private unnamed_addr constant [22 x i8] c"Size1=%lu, size2=%lu\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.9 = private unnamed_addr constant [38 x i8] c"\0AError: Can't open file for writing!\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"\22%s\22 is%s in \22%s\22\00", align 1
@.str.11 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.12 = private unnamed_addr constant [5 x i8] c" not\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c" [\22%s\22]\00", align 1

; Function Attrs: nofree nounwind memory(readwrite, argmem: read, inaccessiblemem: none) uwtable
define dso_local void @bmha_init(ptr noundef %arg) local_unnamed_addr #0 {
bb:
  store ptr %arg, ptr @pat, align 8, !tbaa !8
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #20
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen, align 4, !tbaa !12
  %i2 = and i64 %i, 4294967295
  %i3 = getelementptr i8, ptr %arg, i64 -1
  br label %bb4

bb4:                                              ; preds = %bb30.bb4_crit_edge, %bb
  %i5 = phi i64 [ 0, %bb ], [ %i31, %bb30.bb4_crit_edge ]
  %i6 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i5
  store i32 %i1, ptr %i6, align 4, !tbaa !12
  %i7 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i5
  br label %bb8

bb8:                                              ; preds = %bb12.bb8_crit_edge, %bb4
  %i9 = phi i64 [ %i13, %bb12.bb8_crit_edge ], [ %i2, %bb4 ]
  %i10 = trunc i64 %i9 to i32
  %i11 = icmp sgt i32 %i10, 0
  br i1 %i11, label %bb12, label %bb24

bb12:                                             ; preds = %bb8
  %i13 = add nsw i64 %i9, -1
  %i14 = load i8, ptr %i7, align 1, !tbaa !14
  %i15 = getelementptr i8, ptr %i3, i64 %i9
  %i16 = load i8, ptr %i15, align 1, !tbaa !14
  %i17 = zext i8 %i16 to i64
  %i18 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !14
  %i20 = icmp eq i8 %i14, %i19
  br i1 %i20, label %bb21, label %bb12.bb8_crit_edge, !llvm.loop !15

bb12.bb8_crit_edge:                               ; preds = %bb12
  br label %bb8

bb21:                                             ; preds = %bb12
  %i22 = trunc i64 %i9 to i32
  %i23 = sub i32 %i1, %i22
  store i32 %i23, ptr %i6, align 4, !tbaa !12
  br label %bb26

bb24:                                             ; preds = %bb8
  %i25 = trunc i64 %i9 to i32
  br label %bb26

bb26:                                             ; preds = %bb24, %bb21
  %i27 = phi i32 [ %i25, %bb24 ], [ %i22, %bb21 ]
  %i28 = icmp eq i32 %i27, %i1
  br i1 %i28, label %bb29, label %bb26.bb30_crit_edge

bb26.bb30_crit_edge:                              ; preds = %bb26
  br label %bb30

bb29:                                             ; preds = %bb26
  store i32 32767, ptr %i6, align 4, !tbaa !12
  br label %bb30

bb30:                                             ; preds = %bb26.bb30_crit_edge, %bb29
  %i31 = add nuw nsw i64 %i5, 1
  %i32 = icmp eq i64 %i31, 256
  br i1 %i32, label %bb33, label %bb30.bb4_crit_edge, !llvm.loop !18

bb30.bb4_crit_edge:                               ; preds = %bb30
  br label %bb4

bb33:                                             ; preds = %bb30
  store i32 %i1, ptr @skip2, align 4, !tbaa !12
  %i34 = icmp sgt i32 %i1, 1
  br i1 %i34, label %bb35, label %bb33.bb59_crit_edge

bb33.bb59_crit_edge:                              ; preds = %bb33
  br label %bb59

bb35:                                             ; preds = %bb33
  %i36 = add nsw i32 %i1, -1
  %i37 = sext i32 %i36 to i64
  %i38 = getelementptr inbounds i8, ptr %arg, i64 %i37
  %i39 = load i8, ptr %i38, align 1, !tbaa !14
  %i40 = zext i8 %i39 to i64
  %i41 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i40
  %i42 = load i8, ptr %i41, align 1, !tbaa !14
  %i43 = zext i32 %i36 to i64
  br label %bb44

bb44:                                             ; preds = %bb56.bb44_crit_edge, %bb35
  %i45 = phi i64 [ 0, %bb35 ], [ %i57, %bb56.bb44_crit_edge ]
  %i46 = getelementptr inbounds i8, ptr %arg, i64 %i45
  %i47 = load i8, ptr %i46, align 1, !tbaa !14
  %i48 = zext i8 %i47 to i64
  %i49 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i48
  %i50 = load i8, ptr %i49, align 1, !tbaa !14
  %i51 = icmp eq i8 %i50, %i42
  br i1 %i51, label %bb52, label %bb44.bb56_crit_edge

bb44.bb56_crit_edge:                              ; preds = %bb44
  br label %bb56

bb52:                                             ; preds = %bb44
  %i53 = trunc i64 %i45 to i32
  %i54 = xor i32 %i53, -1
  %i55 = add nsw i32 %i54, %i1
  store i32 %i55, ptr @skip2, align 4, !tbaa !12
  br label %bb56

bb56:                                             ; preds = %bb44.bb56_crit_edge, %bb52
  %i57 = add nuw nsw i64 %i45, 1
  %i58 = icmp eq i64 %i57, %i43
  br i1 %i58, label %bb59.loopexit, label %bb56.bb44_crit_edge, !llvm.loop !19

bb56.bb44_crit_edge:                              ; preds = %bb56
  br label %bb44

bb59.loopexit:                                    ; preds = %bb56
  br label %bb59

bb59:                                             ; preds = %bb33.bb59_crit_edge, %bb59.loopexit
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i64 @strlen(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @bmha_search(ptr noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  %i = load i32, ptr @patlen, align 4, !tbaa !12
  %i2 = xor i32 %arg1, -1
  %i3 = add i32 %i, %i2
  %i4 = icmp sgt i32 %i3, -1
  br i1 %i4, label %bb.bb59_crit_edge, label %bb5

bb.bb59_crit_edge:                                ; preds = %bb
  br label %bb59

bb5:                                              ; preds = %bb
  %i6 = sext i32 %arg1 to i64
  %i7 = getelementptr inbounds i8, ptr %arg, i64 %i6
  %i8 = sub nsw i32 32767, %arg1
  %i9 = add i32 %i, -1
  %i10 = load ptr, ptr @pat, align 8
  %i11 = load i32, ptr @skip2, align 4
  %i12 = zext i32 %i9 to i64
  %i13 = tail call i32 @llvm.smin.i32(i32 %i9, i32 0)
  br label %bb14

bb14:                                             ; preds = %bb24, %bb5
  %i15 = phi i32 [ %i3, %bb5 ], [ %i25, %bb24 ]
  %i16 = sext i32 %i15 to i64
  %i17 = getelementptr inbounds i8, ptr %i7, i64 %i16
  %i18 = load i8, ptr %i17, align 1, !tbaa !14
  %i19 = zext i8 %i18 to i64
  %i20 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i19
  %i21 = load i32, ptr %i20, align 4, !tbaa !12
  %i22 = add nsw i32 %i21, %i15
  %i23 = icmp slt i32 %i22, 0
  br i1 %i23, label %bb14.bb24_crit_edge, label %bb26

bb14.bb24_crit_edge:                              ; preds = %bb14
  br label %bb24

bb24:                                             ; preds = %bb56.bb24_crit_edge, %bb14.bb24_crit_edge
  %i25 = phi i32 [ %i22, %bb14.bb24_crit_edge ], [ %i57, %bb56.bb24_crit_edge ]
  br label %bb14, !llvm.loop !20

bb26:                                             ; preds = %bb14
  %i27 = icmp slt i32 %i22, %i8
  br i1 %i27, label %bb26.bb59.loopexit_crit_edge, label %bb28

bb26.bb59.loopexit_crit_edge:                     ; preds = %bb26
  br label %bb59.loopexit

bb28:                                             ; preds = %bb26
  %i29 = add nsw i32 %i22, -32767
  %i30 = sub nsw i32 %i29, %i9
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i7, i64 %i31
  br label %bb33

bb33:                                             ; preds = %bb37.bb33_crit_edge, %bb28
  %i34 = phi i64 [ %i39, %bb37.bb33_crit_edge ], [ %i12, %bb28 ]
  %i35 = trunc i64 %i34 to i32
  %i36 = icmp sgt i32 %i35, 0
  br i1 %i36, label %bb37, label %bb53.loopexit

bb37:                                             ; preds = %bb33
  %i38 = add nsw i64 %i34, -1
  %i39 = add nsw i64 %i34, -1
  %i40 = getelementptr inbounds i8, ptr %i32, i64 %i38
  %i41 = load i8, ptr %i40, align 1, !tbaa !14
  %i42 = zext i8 %i41 to i64
  %i43 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i42
  %i44 = load i8, ptr %i43, align 1, !tbaa !14
  %i45 = getelementptr inbounds i8, ptr %i10, i64 %i38
  %i46 = load i8, ptr %i45, align 1, !tbaa !14
  %i47 = zext i8 %i46 to i64
  %i48 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i47
  %i49 = load i8, ptr %i48, align 1, !tbaa !14
  %i50 = icmp eq i8 %i44, %i49
  br i1 %i50, label %bb37.bb33_crit_edge, label %bb51, !llvm.loop !21

bb37.bb33_crit_edge:                              ; preds = %bb37
  br label %bb33

bb51:                                             ; preds = %bb37
  %i52 = trunc i64 %i34 to i32
  br label %bb53

bb53.loopexit:                                    ; preds = %bb33
  br label %bb53

bb53:                                             ; preds = %bb53.loopexit, %bb51
  %i54 = phi i32 [ %i52, %bb51 ], [ %i13, %bb53.loopexit ]
  %i55 = icmp slt i32 %i54, 1
  br i1 %i55, label %bb53.bb59.loopexitsplit_crit_edge, label %bb56

bb53.bb59.loopexitsplit_crit_edge:                ; preds = %bb53
  br label %bb59.loopexitsplit

bb56:                                             ; preds = %bb53
  %i57 = add nsw i32 %i11, %i29
  %i58 = icmp sgt i32 %i57, -1
  br i1 %i58, label %bb59.loopexitsplitsplit, label %bb56.bb24_crit_edge

bb56.bb24_crit_edge:                              ; preds = %bb56
  br label %bb24

bb59.loopexitsplitsplit:                          ; preds = %bb56
  br label %bb59.loopexitsplit

bb59.loopexitsplit:                               ; preds = %bb59.loopexitsplitsplit, %bb53.bb59.loopexitsplit_crit_edge
  %i60.ph.ph = phi ptr [ %i32, %bb53.bb59.loopexitsplit_crit_edge ], [ null, %bb59.loopexitsplitsplit ]
  br label %bb59.loopexit

bb59.loopexit:                                    ; preds = %bb59.loopexitsplit, %bb26.bb59.loopexit_crit_edge
  %i60.ph = phi ptr [ null, %bb26.bb59.loopexit_crit_edge ], [ %i60.ph.ph, %bb59.loopexitsplit ]
  br label %bb59

bb59:                                             ; preds = %bb.bb59_crit_edge, %bb59.loopexit
  %i60 = phi ptr [ null, %bb.bb59_crit_edge ], [ %i60.ph, %bb59.loopexit ]
  ret ptr %i60
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nounwind uwtable
define dso_local void @bmhi_init(ptr nocapture noundef readonly %arg) local_unnamed_addr #4 {
bb:
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #20
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.1, align 4, !tbaa !12
  %i2 = load ptr, ptr @pat.2, align 8, !tbaa !8
  %i3 = shl i64 %i, 32
  %i4 = ashr exact i64 %i3, 32
  %i5 = tail call ptr @realloc(ptr noundef %i2, i64 noundef %i4) #21
  store ptr %i5, ptr @pat.2, align 8, !tbaa !8
  %i6 = icmp eq ptr %i5, null
  br i1 %i6, label %bb7, label %bb8

bb7:                                              ; preds = %bb
  tail call void @exit(i32 noundef 1) #22
  unreachable

bb8:                                              ; preds = %bb
  %i9 = tail call i32 @atexit(ptr noundef nonnull @bhmi_cleanup) #23
  %i10 = load i32, ptr @patlen.1, align 4, !tbaa !12
  %i11 = icmp sgt i32 %i10, 0
  br i1 %i11, label %bb13, label %bb8.bb12_crit_edge

bb8.bb12_crit_edge:                               ; preds = %bb8
  br label %bb12

bb12.loopexit:                                    ; preds = %bb17
  br label %bb12

bb12:                                             ; preds = %bb8.bb12_crit_edge, %bb12.loopexit
  br label %bb37

bb13:                                             ; preds = %bb8
  %i14 = tail call ptr @__ctype_toupper_loc() #24
  %i15 = load ptr, ptr @pat.2, align 8, !tbaa !8
  %i16 = zext nneg i32 %i10 to i64
  br label %bb17

bb17:                                             ; preds = %bb17.bb17_crit_edge, %bb13
  %i18 = phi i64 [ 0, %bb13 ], [ %i27, %bb17.bb17_crit_edge ]
  %i19 = load ptr, ptr %i14, align 8, !tbaa !8
  %i20 = getelementptr inbounds i8, ptr %arg, i64 %i18
  %i21 = load i8, ptr %i20, align 1, !tbaa !14
  %i22 = sext i8 %i21 to i64
  %i23 = getelementptr inbounds i32, ptr %i19, i64 %i22
  %i24 = load i32, ptr %i23, align 4, !tbaa !12
  %i25 = trunc i32 %i24 to i8
  %i26 = getelementptr inbounds i8, ptr %i15, i64 %i18
  store i8 %i25, ptr %i26, align 1, !tbaa !14
  %i27 = add nuw nsw i64 %i18, 1
  %i28 = icmp eq i64 %i27, %i16
  br i1 %i28, label %bb12.loopexit, label %bb17.bb17_crit_edge, !llvm.loop !22

bb17.bb17_crit_edge:                              ; preds = %bb17
  br label %bb17

bb29:                                             ; preds = %bb37
  %i30 = add i32 %i10, -1
  %i31 = icmp sgt i32 %i10, 1
  br i1 %i31, label %bb32, label %bb29.bb57_crit_edge

bb29.bb57_crit_edge:                              ; preds = %bb29
  br label %bb57

bb32:                                             ; preds = %bb29
  %i33 = load ptr, ptr @pat.2, align 8, !tbaa !8
  %i34 = tail call ptr @__ctype_tolower_loc() #24
  %i35 = load ptr, ptr %i34, align 8, !tbaa !8
  %i36 = zext i32 %i30 to i64
  br label %bb42

bb37:                                             ; preds = %bb37.bb37_crit_edge, %bb12
  %i38 = phi i64 [ %i40, %bb37.bb37_crit_edge ], [ 0, %bb12 ]
  %i39 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i38
  store i32 %i10, ptr %i39, align 4, !tbaa !12
  %i40 = add nuw nsw i64 %i38, 1
  %i41 = icmp eq i64 %i40, 256
  br i1 %i41, label %bb29, label %bb37.bb37_crit_edge, !llvm.loop !23

bb37.bb37_crit_edge:                              ; preds = %bb37
  br label %bb37

bb42:                                             ; preds = %bb42.bb42_crit_edge, %bb32
  %i43 = phi i64 [ 0, %bb32 ], [ %i55, %bb42.bb42_crit_edge ]
  %i44 = trunc i64 %i43 to i32
  %i45 = xor i32 %i44, -1
  %i46 = add nsw i32 %i10, %i45
  %i47 = getelementptr inbounds i8, ptr %i33, i64 %i43
  %i48 = load i8, ptr %i47, align 1, !tbaa !14
  %i49 = zext i8 %i48 to i64
  %i50 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i49
  store i32 %i46, ptr %i50, align 4, !tbaa !12
  %i51 = getelementptr inbounds i32, ptr %i35, i64 %i49
  %i52 = load i32, ptr %i51, align 4, !tbaa !12
  %i53 = sext i32 %i52 to i64
  %i54 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i53
  store i32 %i46, ptr %i54, align 4, !tbaa !12
  %i55 = add nuw nsw i64 %i43, 1
  %i56 = icmp eq i64 %i55, %i36
  br i1 %i56, label %bb57.loopexit, label %bb42.bb42_crit_edge, !llvm.loop !24

bb42.bb42_crit_edge:                              ; preds = %bb42
  br label %bb42

bb57.loopexit:                                    ; preds = %bb42
  br label %bb57

bb57:                                             ; preds = %bb29.bb57_crit_edge, %bb57.loopexit
  %i58 = load ptr, ptr @pat.2, align 8, !tbaa !8
  %i59 = sext i32 %i30 to i64
  %i60 = getelementptr inbounds i8, ptr %i58, i64 %i59
  %i61 = load i8, ptr %i60, align 1, !tbaa !14
  %i62 = zext i8 %i61 to i64
  %i63 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i62
  store i32 32767, ptr %i63, align 4, !tbaa !12
  %i64 = tail call ptr @__ctype_tolower_loc() #24
  %i65 = load ptr, ptr %i64, align 8, !tbaa !8
  %i66 = zext i8 %i61 to i64
  %i67 = getelementptr inbounds i32, ptr %i65, i64 %i66
  %i68 = load i32, ptr %i67, align 4, !tbaa !12
  %i69 = sext i32 %i68 to i64
  %i70 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i69
  store i32 32767, ptr %i70, align 4, !tbaa !12
  store i32 %i10, ptr @skip2.4, align 4, !tbaa !12
  %i71 = icmp sgt i32 %i10, 1
  br i1 %i71, label %bb72, label %bb57.bb86_crit_edge

bb57.bb86_crit_edge:                              ; preds = %bb57
  br label %bb86

bb72:                                             ; preds = %bb57
  %i73 = zext i32 %i30 to i64
  br label %bb74

bb74:                                             ; preds = %bb83.bb74_crit_edge, %bb72
  %i75 = phi i64 [ 0, %bb72 ], [ %i84, %bb83.bb74_crit_edge ]
  %i76 = getelementptr inbounds i8, ptr %i58, i64 %i75
  %i77 = load i8, ptr %i76, align 1, !tbaa !14
  %i78 = icmp eq i8 %i77, %i61
  br i1 %i78, label %bb79, label %bb74.bb83_crit_edge

bb74.bb83_crit_edge:                              ; preds = %bb74
  br label %bb83

bb79:                                             ; preds = %bb74
  %i80 = trunc i64 %i75 to i32
  %i81 = xor i32 %i80, -1
  %i82 = add nsw i32 %i10, %i81
  store i32 %i82, ptr @skip2.4, align 4, !tbaa !12
  br label %bb83

bb83:                                             ; preds = %bb74.bb83_crit_edge, %bb79
  %i84 = add nuw nsw i64 %i75, 1
  %i85 = icmp eq i64 %i84, %i73
  br i1 %i85, label %bb86.loopexit, label %bb83.bb74_crit_edge, !llvm.loop !25

bb83.bb74_crit_edge:                              ; preds = %bb83
  br label %bb74

bb86.loopexit:                                    ; preds = %bb83
  br label %bb86

bb86:                                             ; preds = %bb57.bb86_crit_edge, %bb86.loopexit
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare noalias noundef ptr @realloc(ptr allocptr nocapture noundef, i64 noundef) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nounwind willreturn uwtable
define dso_local void @bhmi_cleanup() #7 {
bb:
  %i = load ptr, ptr @pat.2, align 8, !tbaa !8
  tail call void @free(ptr noundef %i) #23
  ret void
}

; Function Attrs: nounwind
declare i32 @atexit(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare ptr @__ctype_toupper_loc() local_unnamed_addr #9

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare ptr @__ctype_tolower_loc() local_unnamed_addr #9

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #10

; Function Attrs: nofree nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @bmhi_search(ptr noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #11 {
bb:
  %i = load i32, ptr @patlen.1, align 4, !tbaa !12
  %i2 = xor i32 %arg1, -1
  %i3 = add i32 %i, %i2
  %i4 = icmp sgt i32 %i3, -1
  br i1 %i4, label %bb.bb59_crit_edge, label %bb5

bb.bb59_crit_edge:                                ; preds = %bb
  br label %bb59

bb5:                                              ; preds = %bb
  %i6 = sext i32 %arg1 to i64
  %i7 = getelementptr inbounds i8, ptr %arg, i64 %i6
  %i8 = sub nsw i32 32767, %arg1
  %i9 = add i32 %i, -1
  %i10 = load ptr, ptr @pat.2, align 8
  %i11 = load i32, ptr @skip2.4, align 4
  %i12 = zext i32 %i9 to i64
  %i13 = tail call i32 @llvm.smin.i32(i32 %i9, i32 0)
  br label %bb14

bb14:                                             ; preds = %bb24, %bb5
  %i15 = phi i32 [ %i3, %bb5 ], [ %i25, %bb24 ]
  %i16 = sext i32 %i15 to i64
  %i17 = getelementptr inbounds i8, ptr %i7, i64 %i16
  %i18 = load i8, ptr %i17, align 1, !tbaa !14
  %i19 = zext i8 %i18 to i64
  %i20 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i19
  %i21 = load i32, ptr %i20, align 4, !tbaa !12
  %i22 = add nsw i32 %i21, %i15
  %i23 = icmp slt i32 %i22, 0
  br i1 %i23, label %bb14.bb24_crit_edge, label %bb26

bb14.bb24_crit_edge:                              ; preds = %bb14
  br label %bb24

bb24:                                             ; preds = %bb56.bb24_crit_edge, %bb14.bb24_crit_edge
  %i25 = phi i32 [ %i22, %bb14.bb24_crit_edge ], [ %i57, %bb56.bb24_crit_edge ]
  br label %bb14, !llvm.loop !26

bb26:                                             ; preds = %bb14
  %i27 = icmp slt i32 %i22, %i8
  br i1 %i27, label %bb26.bb59.loopexit_crit_edge, label %bb28

bb26.bb59.loopexit_crit_edge:                     ; preds = %bb26
  br label %bb59.loopexit

bb28:                                             ; preds = %bb26
  %i29 = add nsw i32 %i22, -32767
  %i30 = sub nsw i32 %i29, %i9
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i7, i64 %i31
  br label %bb33

bb33:                                             ; preds = %bb37.bb33_crit_edge, %bb28
  %i34 = phi i64 [ %i39, %bb37.bb33_crit_edge ], [ %i12, %bb28 ]
  %i35 = trunc i64 %i34 to i32
  %i36 = icmp sgt i32 %i35, 0
  br i1 %i36, label %bb37, label %bb53.loopexit

bb37:                                             ; preds = %bb33
  %i38 = add nsw i64 %i34, -1
  %i39 = add nsw i64 %i34, -1
  %i40 = tail call ptr @__ctype_toupper_loc() #24
  %i41 = load ptr, ptr %i40, align 8, !tbaa !8
  %i42 = getelementptr inbounds i8, ptr %i32, i64 %i38
  %i43 = load i8, ptr %i42, align 1, !tbaa !14
  %i44 = sext i8 %i43 to i64
  %i45 = getelementptr inbounds i32, ptr %i41, i64 %i44
  %i46 = load i32, ptr %i45, align 4, !tbaa !12
  %i47 = getelementptr inbounds i8, ptr %i10, i64 %i38
  %i48 = load i8, ptr %i47, align 1, !tbaa !14
  %i49 = zext i8 %i48 to i32
  %i50 = icmp eq i32 %i46, %i49
  br i1 %i50, label %bb37.bb33_crit_edge, label %bb51, !llvm.loop !27

bb37.bb33_crit_edge:                              ; preds = %bb37
  br label %bb33

bb51:                                             ; preds = %bb37
  %i52 = trunc i64 %i34 to i32
  br label %bb53

bb53.loopexit:                                    ; preds = %bb33
  br label %bb53

bb53:                                             ; preds = %bb53.loopexit, %bb51
  %i54 = phi i32 [ %i52, %bb51 ], [ %i13, %bb53.loopexit ]
  %i55 = icmp slt i32 %i54, 1
  br i1 %i55, label %bb53.bb59.loopexitsplit_crit_edge, label %bb56

bb53.bb59.loopexitsplit_crit_edge:                ; preds = %bb53
  br label %bb59.loopexitsplit

bb56:                                             ; preds = %bb53
  %i57 = add nsw i32 %i11, %i29
  %i58 = icmp sgt i32 %i57, -1
  br i1 %i58, label %bb59.loopexitsplitsplit, label %bb56.bb24_crit_edge

bb56.bb24_crit_edge:                              ; preds = %bb56
  br label %bb24

bb59.loopexitsplitsplit:                          ; preds = %bb56
  br label %bb59.loopexitsplit

bb59.loopexitsplit:                               ; preds = %bb59.loopexitsplitsplit, %bb53.bb59.loopexitsplit_crit_edge
  %i60.ph.ph = phi ptr [ %i32, %bb53.bb59.loopexitsplit_crit_edge ], [ null, %bb59.loopexitsplitsplit ]
  br label %bb59.loopexit

bb59.loopexit:                                    ; preds = %bb59.loopexitsplit, %bb26.bb59.loopexit_crit_edge
  %i60.ph = phi ptr [ null, %bb26.bb59.loopexit_crit_edge ], [ %i60.ph.ph, %bb59.loopexitsplit ]
  br label %bb59

bb59:                                             ; preds = %bb.bb59_crit_edge, %bb59.loopexit
  %i60 = phi ptr [ null, %bb.bb59_crit_edge ], [ %i60.ph, %bb59.loopexit ]
  ret ptr %i60
}

; Function Attrs: nofree nounwind memory(write, argmem: read, inaccessiblemem: none) uwtable
define dso_local void @bmh_init(ptr noundef %arg) local_unnamed_addr #12 {
bb:
  store ptr %arg, ptr @pat.5, align 8, !tbaa !8
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #20
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.6, align 4, !tbaa !12
  br label %bb6

bb2:                                              ; preds = %bb6
  %i3 = icmp sgt i32 %i1, 0
  br i1 %i3, label %bb4, label %bb2.bb22_crit_edge

bb2.bb22_crit_edge:                               ; preds = %bb2
  br label %bb22

bb4:                                              ; preds = %bb2
  %i5 = and i64 %i, 4294967295
  br label %bb11

bb6:                                              ; preds = %bb6.bb6_crit_edge, %bb
  %i7 = phi i64 [ 0, %bb ], [ %i9, %bb6.bb6_crit_edge ]
  %i8 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i7
  store i32 %i1, ptr %i8, align 4, !tbaa !12
  %i9 = add nuw nsw i64 %i7, 1
  %i10 = icmp eq i64 %i9, 256
  br i1 %i10, label %bb2, label %bb6.bb6_crit_edge, !llvm.loop !28

bb6.bb6_crit_edge:                                ; preds = %bb6
  br label %bb6

bb11:                                             ; preds = %bb11.bb11_crit_edge, %bb4
  %i12 = phi i64 [ 0, %bb4 ], [ %i20, %bb11.bb11_crit_edge ]
  %i13 = trunc i64 %i12 to i32
  %i14 = xor i32 %i13, -1
  %i15 = add nsw i32 %i14, %i1
  %i16 = getelementptr inbounds i8, ptr %arg, i64 %i12
  %i17 = load i8, ptr %i16, align 1, !tbaa !14
  %i18 = zext i8 %i17 to i64
  %i19 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i18
  store i32 %i15, ptr %i19, align 4, !tbaa !12
  %i20 = add nuw nsw i64 %i12, 1
  %i21 = icmp eq i64 %i20, %i5
  br i1 %i21, label %bb22.loopexit, label %bb11.bb11_crit_edge, !llvm.loop !29

bb11.bb11_crit_edge:                              ; preds = %bb11
  br label %bb11

bb22.loopexit:                                    ; preds = %bb11
  br label %bb22

bb22:                                             ; preds = %bb2.bb22_crit_edge, %bb22.loopexit
  %i23 = shl i64 %i, 32
  %i24 = ashr exact i64 %i23, 32
  %i25 = getelementptr i8, ptr %arg, i64 %i24
  %i26 = getelementptr i8, ptr %i25, i64 -1
  %i27 = load i8, ptr %i26, align 1, !tbaa !14
  %i28 = zext i8 %i27 to i64
  %i29 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i28
  store i32 32767, ptr %i29, align 4, !tbaa !12
  store i32 %i1, ptr @skip2.8, align 4, !tbaa !12
  %i30 = icmp sgt i32 %i1, 1
  br i1 %i30, label %bb31, label %bb22.bb46_crit_edge

bb22.bb46_crit_edge:                              ; preds = %bb22
  br label %bb46

bb31:                                             ; preds = %bb22
  %i32 = add i64 %i, 4294967295
  %i33 = and i64 %i32, 4294967295
  br label %bb34

bb34:                                             ; preds = %bb43.bb34_crit_edge, %bb31
  %i35 = phi i64 [ 0, %bb31 ], [ %i44, %bb43.bb34_crit_edge ]
  %i36 = getelementptr inbounds i8, ptr %arg, i64 %i35
  %i37 = load i8, ptr %i36, align 1, !tbaa !14
  %i38 = icmp eq i8 %i37, %i27
  br i1 %i38, label %bb39, label %bb34.bb43_crit_edge

bb34.bb43_crit_edge:                              ; preds = %bb34
  br label %bb43

bb39:                                             ; preds = %bb34
  %i40 = trunc i64 %i35 to i32
  %i41 = xor i32 %i40, -1
  %i42 = add nsw i32 %i41, %i1
  store i32 %i42, ptr @skip2.8, align 4, !tbaa !12
  br label %bb43

bb43:                                             ; preds = %bb34.bb43_crit_edge, %bb39
  %i44 = add nuw nsw i64 %i35, 1
  %i45 = icmp eq i64 %i44, %i33
  br i1 %i45, label %bb46.loopexit, label %bb43.bb34_crit_edge, !llvm.loop !30

bb43.bb34_crit_edge:                              ; preds = %bb43
  br label %bb34

bb46.loopexit:                                    ; preds = %bb43
  br label %bb46

bb46:                                             ; preds = %bb22.bb46_crit_edge, %bb46.loopexit
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @bmh_search(ptr noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  %i = load i32, ptr @patlen.6, align 4, !tbaa !12
  %i2 = xor i32 %arg1, -1
  %i3 = add i32 %i, %i2
  %i4 = icmp sgt i32 %i3, -1
  br i1 %i4, label %bb.bb55_crit_edge, label %bb5

bb.bb55_crit_edge:                                ; preds = %bb
  br label %bb55

bb5:                                              ; preds = %bb
  %i6 = sext i32 %arg1 to i64
  %i7 = getelementptr inbounds i8, ptr %arg, i64 %i6
  %i8 = sub nsw i32 32767, %arg1
  %i9 = add i32 %i, -1
  %i10 = load ptr, ptr @pat.5, align 8
  %i11 = load i32, ptr @skip2.8, align 4
  %i12 = zext i32 %i9 to i64
  %i13 = tail call i32 @llvm.smin.i32(i32 %i9, i32 0)
  br label %bb14

bb14:                                             ; preds = %bb24, %bb5
  %i15 = phi i32 [ %i3, %bb5 ], [ %i25, %bb24 ]
  %i16 = sext i32 %i15 to i64
  %i17 = getelementptr inbounds i8, ptr %i7, i64 %i16
  %i18 = load i8, ptr %i17, align 1, !tbaa !14
  %i19 = zext i8 %i18 to i64
  %i20 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i19
  %i21 = load i32, ptr %i20, align 4, !tbaa !12
  %i22 = add nsw i32 %i21, %i15
  %i23 = icmp slt i32 %i22, 0
  br i1 %i23, label %bb14.bb24_crit_edge, label %bb26

bb14.bb24_crit_edge:                              ; preds = %bb14
  br label %bb24

bb24:                                             ; preds = %bb52.bb24_crit_edge, %bb14.bb24_crit_edge
  %i25 = phi i32 [ %i22, %bb14.bb24_crit_edge ], [ %i53, %bb52.bb24_crit_edge ]
  br label %bb14, !llvm.loop !31

bb26:                                             ; preds = %bb14
  %i27 = icmp slt i32 %i22, %i8
  br i1 %i27, label %bb26.bb55.loopexit_crit_edge, label %bb28

bb26.bb55.loopexit_crit_edge:                     ; preds = %bb26
  br label %bb55.loopexit

bb28:                                             ; preds = %bb26
  %i29 = add nsw i32 %i22, -32767
  %i30 = sub nsw i32 %i29, %i9
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i7, i64 %i31
  br label %bb33

bb33:                                             ; preds = %bb37.bb33_crit_edge, %bb28
  %i34 = phi i64 [ %i39, %bb37.bb33_crit_edge ], [ %i12, %bb28 ]
  %i35 = trunc i64 %i34 to i32
  %i36 = icmp sgt i32 %i35, 0
  br i1 %i36, label %bb37, label %bb49.loopexit

bb37:                                             ; preds = %bb33
  %i38 = add nsw i64 %i34, -1
  %i39 = add nsw i64 %i34, -1
  %i40 = getelementptr inbounds i8, ptr %i32, i64 %i38
  %i41 = load i8, ptr %i40, align 1, !tbaa !14
  %i42 = sext i8 %i41 to i32
  %i43 = getelementptr inbounds i8, ptr %i10, i64 %i38
  %i44 = load i8, ptr %i43, align 1, !tbaa !14
  %i45 = zext i8 %i44 to i32
  %i46 = icmp eq i32 %i42, %i45
  br i1 %i46, label %bb37.bb33_crit_edge, label %bb47, !llvm.loop !32

bb37.bb33_crit_edge:                              ; preds = %bb37
  br label %bb33

bb47:                                             ; preds = %bb37
  %i48 = trunc i64 %i34 to i32
  br label %bb49

bb49.loopexit:                                    ; preds = %bb33
  br label %bb49

bb49:                                             ; preds = %bb49.loopexit, %bb47
  %i50 = phi i32 [ %i48, %bb47 ], [ %i13, %bb49.loopexit ]
  %i51 = icmp slt i32 %i50, 1
  br i1 %i51, label %bb49.bb55.loopexitsplit_crit_edge, label %bb52

bb49.bb55.loopexitsplit_crit_edge:                ; preds = %bb49
  br label %bb55.loopexitsplit

bb52:                                             ; preds = %bb49
  %i53 = add nsw i32 %i11, %i29
  %i54 = icmp sgt i32 %i53, -1
  br i1 %i54, label %bb55.loopexitsplitsplit, label %bb52.bb24_crit_edge

bb52.bb24_crit_edge:                              ; preds = %bb52
  br label %bb24

bb55.loopexitsplitsplit:                          ; preds = %bb52
  br label %bb55.loopexitsplit

bb55.loopexitsplit:                               ; preds = %bb55.loopexitsplitsplit, %bb49.bb55.loopexitsplit_crit_edge
  %i56.ph.ph = phi ptr [ %i32, %bb49.bb55.loopexitsplit_crit_edge ], [ null, %bb55.loopexitsplitsplit ]
  br label %bb55.loopexit

bb55.loopexit:                                    ; preds = %bb55.loopexitsplit, %bb26.bb55.loopexit_crit_edge
  %i56.ph = phi ptr [ null, %bb26.bb55.loopexit_crit_edge ], [ %i56.ph.ph, %bb55.loopexitsplit ]
  br label %bb55

bb55:                                             ; preds = %bb.bb55_crit_edge, %bb55.loopexit
  %i56 = phi ptr [ null, %bb.bb55_crit_edge ], [ %i56.ph, %bb55.loopexit ]
  ret ptr %i56
}

; Function Attrs: nofree nounwind memory(write, argmem: read, inaccessiblemem: none) uwtable
define dso_local void @init_search(ptr noundef %arg) local_unnamed_addr #12 {
bb:
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #20
  store i64 %i, ptr @len, align 8, !tbaa !33
  br label %bb3

bb1:                                              ; preds = %bb3
  %i2 = icmp eq i64 %i, 0
  br i1 %i2, label %bb1.bb18_crit_edge, label %bb8.preheader

bb1.bb18_crit_edge:                               ; preds = %bb1
  br label %bb18

bb8.preheader:                                    ; preds = %bb1
  br label %bb8

bb3:                                              ; preds = %bb3.bb3_crit_edge, %bb
  %i4 = phi i64 [ 0, %bb ], [ %i6, %bb3.bb3_crit_edge ]
  %i5 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i4
  store i64 %i, ptr %i5, align 8, !tbaa !33
  %i6 = add nuw nsw i64 %i4, 1
  %i7 = icmp eq i64 %i6, 256
  br i1 %i7, label %bb1, label %bb3.bb3_crit_edge, !llvm.loop !35

bb3.bb3_crit_edge:                                ; preds = %bb3
  br label %bb3

bb8:                                              ; preds = %bb8.bb8_crit_edge, %bb8.preheader
  %i9 = phi i64 [ %i16, %bb8.bb8_crit_edge ], [ 0, %bb8.preheader ]
  %i10 = xor i64 %i9, -1
  %i11 = add i64 %i, %i10
  %i12 = getelementptr inbounds i8, ptr %arg, i64 %i9
  %i13 = load i8, ptr %i12, align 1, !tbaa !14
  %i14 = zext i8 %i13 to i64
  %i15 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i14
  store i64 %i11, ptr %i15, align 8, !tbaa !33
  %i16 = add nuw i64 %i9, 1
  %i17 = icmp eq i64 %i16, %i
  br i1 %i17, label %bb18.loopexit, label %bb8.bb8_crit_edge, !llvm.loop !36

bb8.bb8_crit_edge:                                ; preds = %bb8
  br label %bb8

bb18.loopexit:                                    ; preds = %bb8
  br label %bb18

bb18:                                             ; preds = %bb1.bb18_crit_edge, %bb18.loopexit
  store ptr %arg, ptr @findme, align 8, !tbaa !8
  ret void
}

; Function Attrs: nofree nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local noundef ptr @strsearch(ptr noundef readonly %arg) local_unnamed_addr #13 {
bb:
  %i = load i64, ptr @len, align 8, !tbaa !33
  %i1 = add i64 %i, -1
  %i2 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #20
  %i3 = getelementptr i8, ptr %arg, i64 1
  %i4 = icmp ult i64 %i1, %i2
  br i1 %i4, label %bb5, label %bb.bb32_crit_edge

bb.bb32_crit_edge:                                ; preds = %bb
  br label %bb32

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @findme, align 8
  br label %bb12

bb7:                                              ; preds = %bb12
  %i8 = add i64 %i18, %i13
  %i9 = icmp ult i64 %i8, %i2
  br i1 %i9, label %bb7.bb10_crit_edge, label %bb7.bb20_crit_edge

bb7.bb20_crit_edge:                               ; preds = %bb7
  br label %bb20

bb7.bb10_crit_edge:                               ; preds = %bb7
  br label %bb10

bb10:                                             ; preds = %bb29.bb10_crit_edge, %bb7.bb10_crit_edge
  %i11 = phi i64 [ %i8, %bb7.bb10_crit_edge ], [ %i30, %bb29.bb10_crit_edge ]
  br label %bb12, !llvm.loop !37

bb12:                                             ; preds = %bb10, %bb5
  %i13 = phi i64 [ %i1, %bb5 ], [ %i11, %bb10 ]
  %i14 = getelementptr inbounds i8, ptr %arg, i64 %i13
  %i15 = load i8, ptr %i14, align 1, !tbaa !14
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i16
  %i18 = load i64, ptr %i17, align 8, !tbaa !33
  %i19 = icmp eq i64 %i18, 0
  br i1 %i19, label %bb12.bb20_crit_edge, label %bb7

bb12.bb20_crit_edge:                              ; preds = %bb12
  br label %bb20

bb20:                                             ; preds = %bb12.bb20_crit_edge, %bb7.bb20_crit_edge
  %i21 = phi i64 [ %i8, %bb7.bb20_crit_edge ], [ %i13, %bb12.bb20_crit_edge ]
  br i1 %i19, label %bb22, label %bb20.bb29_crit_edge

bb20.bb29_crit_edge:                              ; preds = %bb20
  br label %bb29

bb22:                                             ; preds = %bb20
  %i23 = sub i64 %i21, %i
  %i24 = getelementptr i8, ptr %i3, i64 %i23
  %i25 = tail call i32 @strncmp(ptr noundef %i6, ptr noundef %i24, i64 noundef %i) #20
  %i26 = icmp eq i32 %i25, 0
  br i1 %i26, label %bb22.bb32.loopexit_crit_edge, label %bb27

bb22.bb32.loopexit_crit_edge:                     ; preds = %bb22
  br label %bb32.loopexit

bb27:                                             ; preds = %bb22
  %i28 = add i64 %i21, 1
  br label %bb29

bb29:                                             ; preds = %bb20.bb29_crit_edge, %bb27
  %i30 = phi i64 [ %i28, %bb27 ], [ %i21, %bb20.bb29_crit_edge ]
  %i31 = icmp ult i64 %i30, %i2
  br i1 %i31, label %bb29.bb10_crit_edge, label %bb32.loopexitsplit

bb29.bb10_crit_edge:                              ; preds = %bb29
  br label %bb10

bb32.loopexitsplit:                               ; preds = %bb29
  br label %bb32.loopexit

bb32.loopexit:                                    ; preds = %bb32.loopexitsplit, %bb22.bb32.loopexit_crit_edge
  %i33.ph = phi ptr [ %i24, %bb22.bb32.loopexit_crit_edge ], [ null, %bb32.loopexitsplit ]
  br label %bb32

bb32:                                             ; preds = %bb.bb32_crit_edge, %bb32.loopexit
  %i33 = phi ptr [ null, %bb.bb32_crit_edge ], [ %i33.ph, %bb32.loopexit ]
  ret ptr %i33
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @strncmp(ptr nocapture noundef, ptr nocapture noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr nocapture noundef readonly %arg1) local_unnamed_addr #4 {
bb:
  %i = alloca i64, align 8
  %i2 = alloca [128000 x ptr], align 16
  %i3 = alloca [128000 x ptr], align 16
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #23
  call void @llvm.lifetime.start.p0(i64 1024000, ptr nonnull %i2) #23
  call void @llvm.lifetime.start.p0(i64 1024000, ptr nonnull %i3) #23
  %i4 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i5 = icmp eq ptr %i4, null
  br i1 %i5, label %bb6, label %bb9

bb6:                                              ; preds = %bb
  %i7 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i8 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i7) #25
  tail call void @exit(i32 noundef 1) #22
  unreachable

bb9:                                              ; preds = %bb
  %i10 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i4, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #23
  %i11 = call i32 @fclose(ptr noundef nonnull %i4)
  %i12 = icmp slt i32 %arg, 3
  br i1 %i12, label %bb13, label %bb16

bb13:                                             ; preds = %bb9
  %i14 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i15 = call i64 @fwrite(ptr nonnull @.str.4, i64 27, i64 1, ptr %i14) #25
  call void @exit(i32 noundef 1) #22
  unreachable

bb16:                                             ; preds = %bb9
  %i17 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i18 = load ptr, ptr %i17, align 8, !tbaa !8
  %i19 = call noalias ptr @fopen(ptr noundef %i18, ptr noundef nonnull @.str.1)
  %i20 = icmp eq ptr %i19, null
  br i1 %i20, label %bb21, label %bb24

bb21:                                             ; preds = %bb16
  %i22 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i23 = call i64 @fwrite(ptr nonnull @.str.5, i64 25, i64 1, ptr %i22) #25
  call void @exit(i32 noundef 1) #22
  unreachable

bb24:                                             ; preds = %bb16
  %i25 = getelementptr inbounds ptr, ptr %arg1, i64 2
  %i26 = load ptr, ptr %i25, align 8, !tbaa !8
  %i27 = call noalias ptr @fopen(ptr noundef %i26, ptr noundef nonnull @.str.1)
  %i28 = icmp eq ptr %i27, null
  br i1 %i28, label %bb29, label %bb32.preheader

bb32.preheader:                                   ; preds = %bb24
  br label %bb32

bb29:                                             ; preds = %bb24
  %i30 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i31 = call i64 @fwrite(ptr nonnull @.str.6, i64 35, i64 1, ptr %i30) #25
  call void @exit(i32 noundef 1) #22
  unreachable

bb32:                                             ; preds = %bb32.preheader, %bb40
  %i33 = phi i64 [ %i43, %bb40 ], [ 0, %bb32.preheader ]
  %i34 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i19)
  %i35 = icmp eq ptr %i34, null
  br i1 %i35, label %bb32.bb39_crit_edge, label %bb36

bb32.bb39_crit_edge:                              ; preds = %bb32
  br label %bb39

bb36:                                             ; preds = %bb32
  %i37 = call i32 @feof(ptr noundef nonnull %i19) #23
  %i38 = icmp eq i32 %i37, 0
  br i1 %i38, label %bb40, label %bb39split

bb39split:                                        ; preds = %bb36
  br label %bb39

bb39:                                             ; preds = %bb39split, %bb32.bb39_crit_edge
  br label %bb44

bb40:                                             ; preds = %bb36
  %i41 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #20
  %i42 = add i64 %i33, 1
  %i43 = add i64 %i42, %i41
  br label %bb32, !llvm.loop !38

bb44:                                             ; preds = %bb51, %bb39
  %i45 = phi i64 [ %i54, %bb51 ], [ 0, %bb39 ]
  %i46 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i27)
  %i47 = icmp eq ptr %i46, null
  br i1 %i47, label %bb44.bb55_crit_edge, label %bb48

bb44.bb55_crit_edge:                              ; preds = %bb44
  br label %bb55

bb48:                                             ; preds = %bb44
  %i49 = call i32 @feof(ptr noundef nonnull %i27) #23
  %i50 = icmp eq i32 %i49, 0
  br i1 %i50, label %bb51, label %bb55split

bb51:                                             ; preds = %bb48
  %i52 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #20
  %i53 = add i64 %i45, 1
  %i54 = add i64 %i53, %i52
  br label %bb44, !llvm.loop !39

bb55split:                                        ; preds = %bb48
  br label %bb55

bb55:                                             ; preds = %bb55split, %bb44.bb55_crit_edge
  %i56 = call i32 @fclose(ptr noundef nonnull %i19)
  %i57 = call i32 @fclose(ptr noundef nonnull %i27)
  %i58 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i64 noundef %i33, i64 noundef %i45)
  %i59 = call noalias ptr @malloc(i64 noundef %i33) #26
  %i60 = call noalias ptr @malloc(i64 noundef %i45) #26
  %i61 = load ptr, ptr %i17, align 8, !tbaa !8
  %i62 = call noalias ptr @fopen(ptr noundef %i61, ptr noundef nonnull @.str.1)
  %i63 = icmp eq ptr %i62, null
  br i1 %i63, label %bb64, label %bb67

bb64:                                             ; preds = %bb55
  %i65 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i66 = call i64 @fwrite(ptr nonnull @.str.5, i64 25, i64 1, ptr %i65) #25
  call void @exit(i32 noundef 1) #22
  unreachable

bb67:                                             ; preds = %bb55
  %i68 = load ptr, ptr %i25, align 8, !tbaa !8
  %i69 = call noalias ptr @fopen(ptr noundef %i68, ptr noundef nonnull @.str.1)
  %i70 = icmp eq ptr %i69, null
  br i1 %i70, label %bb71, label %bb74.preheader

bb74.preheader:                                   ; preds = %bb67
  br label %bb74

bb71:                                             ; preds = %bb67
  %i72 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i73 = call i64 @fwrite(ptr nonnull @.str.6, i64 35, i64 1, ptr %i72) #25
  call void @exit(i32 noundef 1) #22
  unreachable

bb74:                                             ; preds = %bb74.preheader, %bb88
  %i75 = phi i64 [ %i95, %bb88 ], [ 0, %bb74.preheader ]
  %i76 = phi i64 [ %i92, %bb88 ], [ 0, %bb74.preheader ]
  %i77 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i62)
  %i78 = icmp eq ptr %i77, null
  br i1 %i78, label %bb74.bb96_crit_edge, label %bb79

bb74.bb96_crit_edge:                              ; preds = %bb74
  br label %bb96

bb79:                                             ; preds = %bb74
  %i80 = call i32 @feof(ptr noundef nonnull %i62) #23
  %i81 = icmp eq i32 %i80, 0
  br i1 %i81, label %bb82, label %bb96split

bb82:                                             ; preds = %bb79
  %i83 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #20
  %i84 = icmp eq i64 %i83, 0
  br i1 %i84, label %bb82.bb88_crit_edge, label %bb85

bb82.bb88_crit_edge:                              ; preds = %bb82
  br label %bb88

bb85:                                             ; preds = %bb82
  %i86 = add i64 %i83, -1
  %i87 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i86
  store i8 0, ptr %i87, align 1, !tbaa !14
  br label %bb88

bb88:                                             ; preds = %bb82.bb88_crit_edge, %bb85
  %i89 = getelementptr inbounds i8, ptr %i59, i64 %i75
  %i90 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %i89, ptr noundef nonnull dereferenceable(1) @str_misc) #23
  %i91 = getelementptr inbounds [128000 x ptr], ptr %i2, i64 0, i64 %i76
  store ptr %i89, ptr %i91, align 8, !tbaa !8
  %i92 = add nuw nsw i64 %i76, 1
  %i93 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #20
  %i94 = add i64 %i75, 1
  %i95 = add i64 %i94, %i93
  br label %bb74, !llvm.loop !40

bb96split:                                        ; preds = %bb79
  br label %bb96

bb96:                                             ; preds = %bb96split, %bb74.bb96_crit_edge
  %i97 = getelementptr inbounds [128000 x ptr], ptr %i2, i64 0, i64 %i76
  store ptr null, ptr %i97, align 8, !tbaa !8
  br label %bb98

bb98:                                             ; preds = %bb112, %bb96
  %i99 = phi i64 [ 0, %bb96 ], [ %i119, %bb112 ]
  %i100 = phi i64 [ 0, %bb96 ], [ %i116, %bb112 ]
  %i101 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i69)
  %i102 = icmp eq ptr %i101, null
  br i1 %i102, label %bb98.bb120_crit_edge, label %bb103

bb98.bb120_crit_edge:                             ; preds = %bb98
  br label %bb120

bb103:                                            ; preds = %bb98
  %i104 = call i32 @feof(ptr noundef nonnull %i69) #23
  %i105 = icmp eq i32 %i104, 0
  br i1 %i105, label %bb106, label %bb120split

bb106:                                            ; preds = %bb103
  %i107 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #20
  %i108 = icmp eq i64 %i107, 0
  br i1 %i108, label %bb106.bb112_crit_edge, label %bb109

bb106.bb112_crit_edge:                            ; preds = %bb106
  br label %bb112

bb109:                                            ; preds = %bb106
  %i110 = add i64 %i107, -1
  %i111 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i110
  store i8 0, ptr %i111, align 1, !tbaa !14
  br label %bb112

bb112:                                            ; preds = %bb106.bb112_crit_edge, %bb109
  %i113 = getelementptr inbounds i8, ptr %i60, i64 %i99
  %i114 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %i113, ptr noundef nonnull dereferenceable(1) @str_misc) #23
  %i115 = getelementptr inbounds [128000 x ptr], ptr %i3, i64 0, i64 %i100
  store ptr %i113, ptr %i115, align 8, !tbaa !8
  %i116 = add nuw nsw i64 %i100, 1
  %i117 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #20
  %i118 = add i64 %i99, 1
  %i119 = add i64 %i118, %i117
  br label %bb98, !llvm.loop !41

bb120split:                                       ; preds = %bb103
  br label %bb120

bb120:                                            ; preds = %bb120split, %bb98.bb120_crit_edge
  %i121 = getelementptr inbounds [128000 x ptr], ptr %i3, i64 0, i64 %i100
  store ptr null, ptr %i121, align 8, !tbaa !8
  %i122 = call i32 @fclose(ptr noundef nonnull %i62)
  %i123 = call i32 @fclose(ptr noundef nonnull %i69)
  %i124 = getelementptr inbounds ptr, ptr %arg1, i64 3
  %i125 = load ptr, ptr %i124, align 8, !tbaa !8
  %i126 = call noalias ptr @fopen(ptr noundef %i125, ptr noundef nonnull @.str.8)
  %i127 = icmp eq ptr %i126, null
  br i1 %i127, label %bb131, label %bb128

bb128:                                            ; preds = %bb120
  %i129 = load ptr, ptr %i3, align 16, !tbaa !8
  %i130 = icmp eq ptr %i129, null
  br i1 %i130, label %bb128.bb212_crit_edge, label %bb134.preheader

bb128.bb212_crit_edge:                            ; preds = %bb128
  br label %bb212

bb134.preheader:                                  ; preds = %bb128
  br label %bb134

bb131:                                            ; preds = %bb120
  %i132 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i133 = call i64 @fwrite(ptr nonnull @.str.9, i64 37, i64 1, ptr %i132) #25
  call void @exit(i32 noundef 1) #22
  unreachable

bb134:                                            ; preds = %bb206.bb134_crit_edge, %bb134.preheader
  %i135 = phi i64 [ %i208, %bb206.bb134_crit_edge ], [ 0, %bb134.preheader ]
  %i136 = phi ptr [ %i210, %bb206.bb134_crit_edge ], [ %i129, %bb134.preheader ]
  %i137 = phi ptr [ %i198, %bb206.bb134_crit_edge ], [ null, %bb134.preheader ]
  %i138 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %i136) #20
  store i64 %i138, ptr @len, align 8, !tbaa !33
  br label %bb141

bb139:                                            ; preds = %bb141
  %i140 = icmp eq i64 %i138, 0
  br i1 %i140, label %bb139.bb156_crit_edge, label %bb146.preheader

bb139.bb156_crit_edge:                            ; preds = %bb139
  br label %bb156

bb146.preheader:                                  ; preds = %bb139
  br label %bb146

bb141:                                            ; preds = %bb141.bb141_crit_edge, %bb134
  %i142 = phi i64 [ 0, %bb134 ], [ %i144, %bb141.bb141_crit_edge ]
  %i143 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i142
  store i64 %i138, ptr %i143, align 8, !tbaa !33
  %i144 = add nuw nsw i64 %i142, 1
  %i145 = icmp eq i64 %i144, 256
  br i1 %i145, label %bb139, label %bb141.bb141_crit_edge, !llvm.loop !35

bb141.bb141_crit_edge:                            ; preds = %bb141
  br label %bb141

bb146:                                            ; preds = %bb146.bb146_crit_edge, %bb146.preheader
  %i147 = phi i64 [ %i154, %bb146.bb146_crit_edge ], [ 0, %bb146.preheader ]
  %i148 = xor i64 %i147, -1
  %i149 = add i64 %i138, %i148
  %i150 = getelementptr inbounds i8, ptr %i136, i64 %i147
  %i151 = load i8, ptr %i150, align 1, !tbaa !14
  %i152 = zext i8 %i151 to i64
  %i153 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i152
  store i64 %i149, ptr %i153, align 8, !tbaa !33
  %i154 = add nuw i64 %i147, 1
  %i155 = icmp eq i64 %i154, %i138
  br i1 %i155, label %bb156.loopexit, label %bb146.bb146_crit_edge, !llvm.loop !36

bb146.bb146_crit_edge:                            ; preds = %bb146
  br label %bb146

bb156.loopexit:                                   ; preds = %bb146
  br label %bb156

bb156:                                            ; preds = %bb139.bb156_crit_edge, %bb156.loopexit
  store ptr %i136, ptr @findme, align 8, !tbaa !8
  %i157 = load i64, ptr %i, align 8, !tbaa !33
  %i158 = icmp sgt i64 %i157, 0
  br i1 %i158, label %bb159, label %bb156.bb197_crit_edge

bb156.bb197_crit_edge:                            ; preds = %bb156
  br label %bb197

bb159:                                            ; preds = %bb156
  %i160 = getelementptr inbounds [128000 x ptr], ptr %i2, i64 0, i64 %i135
  %i161 = load ptr, ptr %i160, align 8, !tbaa !8
  %i162 = add i64 %i138, -1
  %i163 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %i161) #20
  %i164 = getelementptr i8, ptr %i161, i64 1
  %i165 = icmp ult i64 %i162, %i163
  br label %bb166

bb166:                                            ; preds = %bb193.bb166_crit_edge, %bb159
  %i167 = phi i64 [ 0, %bb159 ], [ %i195, %bb193.bb166_crit_edge ]
  br i1 %i165, label %bb173.preheader, label %bb166.bb193_crit_edge

bb166.bb193_crit_edge:                            ; preds = %bb166
  br label %bb193

bb173.preheader:                                  ; preds = %bb166
  br label %bb173

bb168:                                            ; preds = %bb173
  %i169 = add i64 %i179, %i174
  %i170 = icmp ult i64 %i169, %i163
  br i1 %i170, label %bb168.bb171_crit_edge, label %bb168.bb181_crit_edge

bb168.bb181_crit_edge:                            ; preds = %bb168
  br label %bb181

bb168.bb171_crit_edge:                            ; preds = %bb168
  br label %bb171

bb171:                                            ; preds = %bb190.bb171_crit_edge, %bb168.bb171_crit_edge
  %i172 = phi i64 [ %i169, %bb168.bb171_crit_edge ], [ %i191, %bb190.bb171_crit_edge ]
  br label %bb173, !llvm.loop !37

bb173:                                            ; preds = %bb173.preheader, %bb171
  %i174 = phi i64 [ %i172, %bb171 ], [ %i162, %bb173.preheader ]
  %i175 = getelementptr inbounds i8, ptr %i161, i64 %i174
  %i176 = load i8, ptr %i175, align 1, !tbaa !14
  %i177 = zext i8 %i176 to i64
  %i178 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i177
  %i179 = load i64, ptr %i178, align 8, !tbaa !33
  %i180 = icmp eq i64 %i179, 0
  br i1 %i180, label %bb173.bb181_crit_edge, label %bb168

bb173.bb181_crit_edge:                            ; preds = %bb173
  br label %bb181

bb181:                                            ; preds = %bb173.bb181_crit_edge, %bb168.bb181_crit_edge
  %i182 = phi i64 [ %i169, %bb168.bb181_crit_edge ], [ %i174, %bb173.bb181_crit_edge ]
  br i1 %i180, label %bb183, label %bb181.bb190_crit_edge

bb181.bb190_crit_edge:                            ; preds = %bb181
  br label %bb190

bb183:                                            ; preds = %bb181
  %i184 = sub i64 %i182, %i138
  %i185 = getelementptr i8, ptr %i164, i64 %i184
  %i186 = call i32 @strncmp(ptr noundef nonnull %i136, ptr noundef %i185, i64 noundef %i138) #20
  %i187 = icmp eq i32 %i186, 0
  br i1 %i187, label %bb183.bb193.loopexit_crit_edge, label %bb188

bb183.bb193.loopexit_crit_edge:                   ; preds = %bb183
  br label %bb193.loopexit

bb188:                                            ; preds = %bb183
  %i189 = add i64 %i182, 1
  br label %bb190

bb190:                                            ; preds = %bb181.bb190_crit_edge, %bb188
  %i191 = phi i64 [ %i189, %bb188 ], [ %i182, %bb181.bb190_crit_edge ]
  %i192 = icmp ult i64 %i191, %i163
  br i1 %i192, label %bb190.bb171_crit_edge, label %bb193.loopexitsplit

bb190.bb171_crit_edge:                            ; preds = %bb190
  br label %bb171

bb193.loopexitsplit:                              ; preds = %bb190
  br label %bb193.loopexit

bb193.loopexit:                                   ; preds = %bb193.loopexitsplit, %bb183.bb193.loopexit_crit_edge
  %i194.ph = phi ptr [ %i185, %bb183.bb193.loopexit_crit_edge ], [ null, %bb193.loopexitsplit ]
  br label %bb193

bb193:                                            ; preds = %bb166.bb193_crit_edge, %bb193.loopexit
  %i194 = phi ptr [ null, %bb166.bb193_crit_edge ], [ %i194.ph, %bb193.loopexit ]
  %i195 = add nuw nsw i64 %i167, 1
  %i196 = icmp eq i64 %i195, %i157
  br i1 %i196, label %bb197.loopexit, label %bb193.bb166_crit_edge, !llvm.loop !42

bb193.bb166_crit_edge:                            ; preds = %bb193
  br label %bb166

bb197.loopexit:                                   ; preds = %bb193
  br label %bb197

bb197:                                            ; preds = %bb156.bb197_crit_edge, %bb197.loopexit
  %i198 = phi ptr [ %i137, %bb156.bb197_crit_edge ], [ %i194, %bb197.loopexit ]
  %i199 = icmp eq ptr %i198, null
  %i200 = select i1 %i199, ptr @.str.12, ptr @.str.11
  %i201 = getelementptr inbounds [128000 x ptr], ptr %i2, i64 0, i64 %i135
  %i202 = load ptr, ptr %i201, align 8, !tbaa !8
  %i203 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef nonnull %i126, ptr noundef nonnull @.str.10, ptr noundef nonnull %i136, ptr noundef nonnull %i200, ptr noundef %i202)
  br i1 %i199, label %bb197.bb206_crit_edge, label %bb204

bb197.bb206_crit_edge:                            ; preds = %bb197
  br label %bb206

bb204:                                            ; preds = %bb197
  %i205 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef nonnull %i126, ptr noundef nonnull @.str.13, ptr noundef nonnull %i198)
  br label %bb206

bb206:                                            ; preds = %bb197.bb206_crit_edge, %bb204
  %i207 = call i32 @fputc(i32 10, ptr nonnull %i126)
  %i208 = add nuw i64 %i135, 1
  %i209 = getelementptr inbounds [128000 x ptr], ptr %i3, i64 0, i64 %i208
  %i210 = load ptr, ptr %i209, align 8, !tbaa !8
  %i211 = icmp eq ptr %i210, null
  br i1 %i211, label %bb212.loopexit, label %bb206.bb134_crit_edge, !llvm.loop !43

bb206.bb134_crit_edge:                            ; preds = %bb206
  br label %bb134

bb212.loopexit:                                   ; preds = %bb206
  br label %bb212

bb212:                                            ; preds = %bb128.bb212_crit_edge, %bb212.loopexit
  %i213 = call i32 @fclose(ptr noundef nonnull %i126)
  call void @llvm.lifetime.end.p0(i64 1024000, ptr nonnull %i3) #23
  call void @llvm.lifetime.end.p0(i64 1024000, ptr nonnull %i2) #23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #23
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #14

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #15

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #16

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #17

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #15

; Function Attrs: nofree nounwind
declare noundef ptr @fgets(ptr noundef, i32 noundef, ptr nocapture noundef) local_unnamed_addr #15

; Function Attrs: nofree nounwind
declare noundef i32 @feof(ptr nocapture noundef) local_unnamed_addr #15

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #15

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #18

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: readwrite)
declare ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias nocapture noundef readonly) local_unnamed_addr #19

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #15

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #16

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #14

attributes #0 = { nofree nounwind memory(readwrite, argmem: read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(argmem: read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nounwind willreturn uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind memory(write, argmem: read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #15 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { nofree nounwind }
attributes #17 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { mustprogress nofree nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #20 = { nounwind willreturn memory(read) }
attributes #21 = { nounwind allocsize(1) }
attributes #22 = { noreturn nounwind }
attributes #23 = { nounwind }
attributes #24 = { nounwind willreturn memory(none) }
attributes #25 = { cold }
attributes #26 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0, !0}
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
!13 = !{!"int", !10, i64 0}
!14 = !{!10, !10, i64 0}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !16, !17}
!19 = distinct !{!19, !16, !17}
!20 = distinct !{!20, !17}
!21 = distinct !{!21, !16, !17}
!22 = distinct !{!22, !16, !17}
!23 = distinct !{!23, !16, !17}
!24 = distinct !{!24, !16, !17}
!25 = distinct !{!25, !16, !17}
!26 = distinct !{!26, !17}
!27 = distinct !{!27, !16, !17}
!28 = distinct !{!28, !16, !17}
!29 = distinct !{!29, !16, !17}
!30 = distinct !{!30, !16, !17}
!31 = distinct !{!31, !17}
!32 = distinct !{!32, !16, !17}
!33 = !{!34, !34, i64 0}
!34 = !{!"long", !10, i64 0}
!35 = distinct !{!35, !16, !17}
!36 = distinct !{!36, !16, !17}
!37 = distinct !{!37, !16, !17}
!38 = distinct !{!38, !16, !17}
!39 = distinct !{!39, !16, !17}
!40 = distinct !{!40, !16, !17}
!41 = distinct !{!41, !16, !17}
!42 = distinct !{!42, !16, !17}
!43 = distinct !{!43, !16, !17}
